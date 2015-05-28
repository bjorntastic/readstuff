class RemovePublishedAndAge < ActiveRecord::Migration
  def change
  	remove_column :users, :age
  	remove_column :books, :published_in
  end
end
