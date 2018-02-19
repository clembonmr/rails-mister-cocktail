# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'json'
require 'open-uri'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
list_of_ingredients = JSON.parse(user_serialized)




puts "Deleting all ingredients"
Ingredient.destroy_all
puts "Creating ingredients"


36.times do
  ingredients = Ingredient.new(name: list_of_ingredients["drinks"].sample["strIngredient1"])
  if ingredients.save
    puts ingredients.name + " created!"
  end
end

puts "#{Ingredient.count} ingredients created!"


puts "Deleting all cocktails"
Cocktail.destroy_all

20.times do
  cocktails = Cocktail.new(name: ["cocktail A", "cocktail B", "cocktail C", "cocktail D", "cocktail E"].sample)
  if cocktails.save
    puts cocktails.name + " created!"
  end
end
