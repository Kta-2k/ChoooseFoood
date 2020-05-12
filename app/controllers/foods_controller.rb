class FoodsController < ApplicationController
  before_action :set_food, only: %i[show]

  def index
    p 'food params : ', food_params
    redirect_to food_path(random_food) if food_params[:category].present?
  end

  def show
    @food_id = {id: params[:id]}
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
