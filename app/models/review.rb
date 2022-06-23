class Review < ActiveRecord::Base
    belongs_to :cocktail
    belongs_to :user
end