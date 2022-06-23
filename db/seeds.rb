# require 'faker'
# require 'cocktaildb'
# Review.destroy_all
Cocktail.destroy_all
Review.destroy_all
User.destroy_all


puts "🌱 Seeding data..."

# Seed your database here


cocktails = []

10.times do 
    random = CocktailDB::random
    cocktails<<random
end
    cocktails.each do |cocktail|
     cocktail = Cocktail.create({
        cocktail_name: cocktail["strDrink"],
        image: cocktail["strDrinkThumb"]
    })
end


#seeding the reviews

10.times do
    Review.create(
        comment: Faker::Hipster.word,
        cocktail_id: rand(1..10),
        user_id: rand(1..10)
    )
end

10.times do
    User.create(
        user_name: Faker::Name.name,
    )
end

puts "✅ Done seeding!"
