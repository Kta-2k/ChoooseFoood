require 'yaml'

food = YAML.load_file("db/food.yml")

food.each do |category, i|
  i.each do |main, j|
    j.each do |name|
      Food.create!(
        name: name,
        category: category,
        main_ingredients: main
      )
    end
  end
end
