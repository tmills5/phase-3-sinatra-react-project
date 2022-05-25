require 'faker'

puts "🌱 Seeding drinks..."

# Seed your database here

ice = Ingredient.create(name: "ice")
vodka = Ingredient.create(name: "vodka")
oj = Ingredient.create(name: "oj")
bourbon = Ingredient.create(name: "bourbon")

test_1_screwdriver = Cocktail.create(name: "ScrewDriver", instructions: "Mix", image: "Test URL")

CocktailIngredient.create(measurement: "glassful", cocktail: test_1_screwdriver, ingredient: ice)
CocktailIngredient.create(measurement: "3oz", cocktail: test_1_screwdriver, ingredient: vodka)
CocktailIngredient.create(measurement: "fill remaining", cocktail: test_1_screwdriver, ingredient: oj)



puts "✅ Done seeding!"
