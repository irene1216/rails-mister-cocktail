require "open-uri"
require "json"
require 'nokogiri'

# seeding ingredients!
# response = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
# json = JSON.parse(response.read)


# json["drinks"].each do |hash|
#   Ingredient.create!(name: hash["strIngredient1"])
# end

response = open("https://raw.githubusercontent.com/maltyeva/iba-cocktails/master/recipes.json")
json = JSON.parse(response.read)

json.each do |cocktail|
  c = Cocktail.create!(name: cocktail["name"])
  cocktail["ingredients"].each do |ingredient|
    if ingredient["ingredient"]
    i = Ingredient.find_or_create_by(name: ingredient["ingredient"])
    d = Dose.create(description: ingredient["amount"].to_s + " " + ingredient["unit"], cocktail: c, ingredient: i)
    puts "Added #{d.description} of #{i.name} to #{c.name}"
    end
  end
end
