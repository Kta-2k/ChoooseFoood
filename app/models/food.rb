class Food < ApplicationRecord
  enum category:{
    "肉": 0,
    "魚": 1,
    "野菜": 2,
    "麺": 3
  }

  has_many :histories
  has_many :user, through: :histories
  
end
