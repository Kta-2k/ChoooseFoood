class HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food_id, only: %i[create]

  def create
    if History.create(user: current_user, food: @food, selected_at: Time.now)
      flash[:success] = "#{@food.name}を履歴に保存しました"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
  end

  private
  
  def set_food_id
    @food = Food.find(history_params[:food_id])
  end

  def history_params
    params.permit(:food_id)
  end
end
