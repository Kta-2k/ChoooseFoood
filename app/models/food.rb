class Food < ApplicationRecord
  enum(
    category: {
      meat: 0,        # 肉
      fish: 1,        # 魚
      vegetables: 2,  # 野菜
      noodle: 3       # 麺
    }
  )
end
