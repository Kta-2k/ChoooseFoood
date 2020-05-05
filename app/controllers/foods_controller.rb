class FoodsController < ApplicationController
  before_action :set_food, only: %i[show]

  def index
    redirect_to food_path(random_food) if food_params.present?
  end

  def show; end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def random_food
    Food.where(category: food_params).order('RAND()').limit(1).first
  end

  def food_params
    params.require(:category)
  end
end
