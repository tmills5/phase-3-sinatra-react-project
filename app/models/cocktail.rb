class Cocktail < ActiveRecord::Base
    has_many :cocktail_ingredients
    has_many :ingredients, through: :cocktail_ingredients

    #Must have a name. Presence determines if attribute is there
    #and wont save if not. Uniqueness validates if the name has 
    #already been taken. Can see errors with cocktail.errors.full_messages
    validates :name, presence: true, uniqueness: true
    validates :instructions, presence: true
end