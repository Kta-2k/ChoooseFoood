require 'yaml'

food = YAML.load_file("db/food.yml")

food.each do |category, main_ingredients|
  main_ingredients.each do |main_ingredient, names|
    names.each do |name|
      Food.create!(
        name: name,
        category: category,
        main_ingredients: main_ingredient
      )
    end
  end
end
