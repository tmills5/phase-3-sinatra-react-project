require 'faker'

puts "🌱 Seeding spices..."

# Seed your database here

ice = Ingredient.find(10)
vodka = Ingredient.find(11)
oj = Ingredient.find(12)

test_1_screwdriver = Cocktail.create(name: "ScrewDriver", instructions: "Mix", image: "Test URL")

CocktailIngredient.create(measurement: "glassful", cocktail: test_1_screwdriver, ingredient: ice)
CocktailIngredient.create(measurement: "3oz", cocktail: test_1_screwdriver, ingredient: vodka)
CocktailIngredient.create(measurement: "fill remaining", cocktail: test_1_screwdriver, ingredient: oj)



puts "✅ Done seeding!"
