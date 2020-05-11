class Food < ApplicationRecord
  enum category:{
    meat: 0,  # 肉
    fish: 1,  # 魚
    vegetable: 2, # 野菜
    noodle: 3 #麺
  }

  has_many :histories
  has_many :user, through: :histories
  
end
