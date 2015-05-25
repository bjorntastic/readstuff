class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :fav_author
      t.string :fav_book
      t.string :fav_genre
      t.integer :age
      
      t.timestamps null: false
    end
  end
end
