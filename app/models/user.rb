class User < ActiveRecord::Base
    has_many :reviews
    has_many :cocktails, through: :reviews

    validates :name, presence: true, uniqueness: true
end