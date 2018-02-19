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

cocktails = Cocktail.new(name: "Mojito")
if cocktails.save
  puts cocktails.name + " created!"
end

cocktails = Cocktail.new(name: "Martini")
if cocktails.save
  puts cocktails.name + " created!"
end
cocktails = Cocktail.new(name: "Margarita")
if cocktails.save
  puts cocktails.name + " created!"
end
cocktails = Cocktail.new(name: "Old Fashion")
if cocktails.save
  puts cocktails.name + " created!"
end
cocktails = Cocktail.new(name: "Daiquiri")
if cocktails.save
  puts cocktails.name + " created!"
end
cocktails = Cocktail.new(name: "Bloody Mary")
if cocktails.save
  puts cocktails.name + " created!"
end
cocktails = Cocktail.new(name: "Gin & Tonic")
if cocktails.save
  puts cocktails.name + " created!"
end
cocktails = Cocktail.new(name: "Pina Colada")
if cocktails.save
  puts cocktails.name + " created!"
end
