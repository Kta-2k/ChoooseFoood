class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @histories = History.where(user: current_user,  selected_at: 1.week.ago.beginning_of_day...Time.current).preload(:food)
  end
end
