# require 'faker'
# require 'cocktaildb'
Review.destroy_all
User.destroy_all
Cocktail.destroy_all

puts "🌱 Seeding data..."

# Seed your database here


cocktails = []

5.times do 
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

#seeding the users

10.times do |user|
    User.create({
        name: Faker::Name.name,
        email: Faker::Internet.email
    })
end


#seeding the reviews

15.times do
    Review.create(
        score: rand(1..10),
        comment: Faker::Hipster.sentence(word_count: 10),
        cocktail_id: rand(1..5),
        user_id: rand(1..10)
    )
end



puts "✅ Done seeding!"
