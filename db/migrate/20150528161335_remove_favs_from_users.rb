class RemoveFavsFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :fav_author, :string
  	remove_column :users, :fav_book, :string
  end
end
