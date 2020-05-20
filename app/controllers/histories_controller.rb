class HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food, only: %i[create]

  def create
    if History.create(user: current_user, food: @food, selected_at: Time.now)
      flash[:notice] = "#{@food.name}を履歴に保存しました"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  
  def set_food
    @food = Food.find(history_params[:food_id])
  end

  def history_params
    params.permit(:food_id)
  end
end
