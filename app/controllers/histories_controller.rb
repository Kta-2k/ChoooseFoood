class HistoriesController < ApplicationController
  before_action :authenticate_user!

  def create
    p "確認　　#{@food_id}"
    @history = History.create(user_id: current_user.id, food_id: food_id[:id])
    if @history.save
      redirect_to root_path
      flash[:success] = "保存しました"
    else
      redirect_to root_path
    end
  end

  def destroy
  end
end
