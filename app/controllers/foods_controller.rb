class FoodsController < ApplicationController
  before_action :set_food, only: %i[show]
  # before_action :food_id, only: %i[show]

  def index
    redirect_to food_path(random_food) if food_params[:category].present?
  end

  def show
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def random_food
    Food.where(category: food_params[:category]).order('RAND()').limit(1).first
  end

  def food_params
    params.permit(:category)
  end
end
