class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :category
      t.string :main_ingredients

      t.timestamps
    end
  end
end
