class FoodController < ApplicationController
  def new

  end

  def index
    if params[:category]
      # p "index"
      # p params[:category].intern


      food = Food.where(category: params[:category].intern).order("RAND()").limit(1).first
      @food = food[:name]
      p @food
    end
  end

  def show
    #@food = Food.where(category: :"肉").order("RAND()").limit(1)
  end

  def create
    # p params[:category]
    # p "create"
    # @food = Food.where(category: :params[:category]).order("RAND()").limit(1).first
  end

end
