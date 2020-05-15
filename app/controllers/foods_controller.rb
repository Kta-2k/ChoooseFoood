class FoodsController < ApplicationController
  before_action :set_food, only: %i[show]
  before_action :set_main_ingredients, only: %i[index]

  def index
    # 選ぶボタン押下後
    if food_params.present?
      @random_food = random_food
      # ちゃんと選択できたか？
      if @random_food.present?
        redirect_to food_path(@random_food)
      else
        flash[:danger] = '選択されたカテゴリーとメイン食材の組み合わせが存在しないため一致するものが見つかりませんでした。もう一度お試しください。'
        redirect_to root_path
      end
    end
  end

  def show
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def random_food
    Food.random_select_by(category: food_params[:category], main_ingredients: food_params[:main_ingredients])
  end

  def food_params
    params.permit(:category, :main_ingredients)
  end

  def set_main_ingredients
    @main_ingredients = Food.pluck(:main_ingredients).uniq
  end
end