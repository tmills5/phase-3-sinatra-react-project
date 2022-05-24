class CocktailIngredient < ActiveRecord::Base
    belongs_to :cocktail
    belongs_to :ingredient

    validates :measurement, presence: true
end