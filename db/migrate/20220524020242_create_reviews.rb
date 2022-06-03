class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :score
      t.text :comment
      t.integer :cocktail_id
      t.timestamps
      t.integer :user_id
    end
  end
end
