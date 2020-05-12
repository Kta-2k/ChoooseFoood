class HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food_id, only: %i[create]

  def create
    if History.create(user_id: current_user.id, food_id: @food_id, selected_at: Time.now)
      flash[:success] = "保存しました"
      redirect_to root_path
    else
      flash[:danger] = "保存できませんでした"
      redirect_to root_path
    end
  end

  def destroy
  end

  private
  
  def set_food_id
    @food_id = food_id_params[:food_id].to_i
  end

  def food_id_params
    params.permit(:food_id)
  end
end
