# require 'faker'
# require 'cocktaildb'
Review.destry_all
User.destroy_all
Cocktail.destroy_all

puts "🌱 Seeding data..."

# Seed your database here


cocktails = []

100.times do 
    random = CocktailDB::random
    cocktails<<random
end
    cocktails.each do |cocktail|
     cocktail = Cocktail.create({
        name: cocktail["strDrink"],
        category: cocktail["strCategory"],
        image: cocktail["strDrinkThumb"],
        glass: cocktail["strGlass"]
    })
end

#seeding the reviews

100.times do 
    Review.create({
        score: rand(1..10),
        comment: Faker::Hipster.sentence(word_count: 20),
        cocktail_id: cocktail_id,
        user_id: user_id
    })
end

#seeding the users

20.times do 
    User.create({
        name: Faker::Name.name,
        email: Faker::Internet.email
    })
end

puts "✅ Done seeding!"
