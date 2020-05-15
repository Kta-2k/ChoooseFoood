class Food < ApplicationRecord
  enum category:{
    meat: 0,  # 肉
    fish: 1,  # 魚
    vegetable: 2, # 野菜
    noodle: 3 #麺
  }

  has_many :histories
  has_many :user, through: :histories
  
  def self.random_select_by(category:, main_ingredients:)
    # すべてを対象とする
    scope = Food.all
  
    # カテゴリの指定があれば、カテゴリの条件を追加
    scope = scope.where(category: category) if category.present?
  
    # メイン食材の指定があれば、メイン食材の条件を追加
    scope = scope.where(main_ingredients: main_ingredients) if main_ingredients.present?
  
    # ランダムで1個選択し返却する
    scope.order('RAND()').limit(1).first
  end
end
