class UsersController < ApplicationController
  
  def show
    @historys = History.where(user: current_user[:id],  selected_at: Time.now.all_week)
  end
end
