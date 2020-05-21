class NostalgiaController < ApplicationController
  before_action :authenticate_user!
  before_action :set_main_ingredients, only: %i[index]
  
  def index
    @histories = History.where(user: current_user,  selected_at: 1.week.ago.beginning_of_day...Time.current).preload(:food).order(selected_at: 'DESC')
  end

  private
  def set_main_ingredients
    @main_ingredients = Food.pluck(:main_ingredients).uniq
  end
end
