class FoodsController < ApplicationController
  before_action :set_food, only: %i[show]
  before_action :set_main_ingredients, only: %i[index]
  before_action :select_food, only: %i[index]

  def index
    if @random_food.present? 
      # ランダム選択が成功した場合
      redirect_to food_path(@random_food) 
    elsif !@random_food.nil? && @random_food.blank?
      # カテゴリーとメイン食材の組み合わせが一致せずにから配列が帰ってきた場合
      # !@random_food.nil?：初期のparamsの値なしで反応させないため
      flash[:danger] = "一致するものがありませんでした。もう一度お試しください。"
      redirect_to root_url
    end
  end

  def show
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def select_food
    @random_food = random_food  # indexのifの評価をしやすくするため
  end

  def random_food
    food = food_params
    # paramsがあるかどうか
    if food.present?
      if food[:category].present? && food[:main_ingredients].present? && Food.where(category: food[:category], main_ingredients: food[:main_ingredients]).present?
        # カテゴリーとメイン食材がどちらも選択されて、かつそれらが正しい組み合わせである場合(例：肉と牛肉)
        Food.where(category: food[:category], main_ingredients: food[:main_ingredients]).order('RAND()').limit(1).first
      elsif food[:category].present? && food[:main_ingredients].present? && Food.where(category: food[:category], main_ingredients: food[:main_ingredients]).blank?
        # カテゴリーとメイン食材がどちらも選択されて、かつそれらが存在しない組み合わせである場合(例：肉と鰤)
        []  # nilだと何もない困るのでから配列
      elsif food[:category].present? && food[:main_ingredients].blank?
        # カテゴリーが選択されていて、メイン食材が選択されていない場合
        Food.where(category: food[:category]).order('RAND()').limit(1).first
      elsif food[:category].blank? && food[:main_ingredients].present?
        # カテゴリーが選択されていない、メイン食材が選択されている場合
        Food.where(main_ingredients: food[:main_ingredients]).order('RAND()').limit(1).first
      else
        # カテゴリーとメイン食材のどちらも選択されていない場合
        Food.where( 'id >= ?', rand(Food.count) + 1 ).first
      end
    end
  end

  def food_params
    params.permit(:category, :main_ingredients)
  end

  def set_main_ingredients
    @main_ingredients = Food.pluck(:main_ingredients).uniq
  end
end
