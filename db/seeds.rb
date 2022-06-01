# require 'faker'
# require 'cocktaildb'
Cocktail.destroy_all

puts "🌱 Seeding data..."

# Seed your database here
cocktails = []

3.times do 
    random = CocktailDB::random
    cocktails<<random
end
    cocktails.each do |cocktail|
     cocktail = Cocktail.create(
        name: cocktail["strDrink"],
        category: cocktail["strCategory"],
        image: cocktail["strDrinkThumb"],
        glass: cocktail["strGlass"]
    )
end


# puts cocktails[0]

puts "✅ Done seeding!"
