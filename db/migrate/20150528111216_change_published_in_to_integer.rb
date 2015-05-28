class ChangePublishedInToInteger < ActiveRecord::Migration
  def change
  	remove_column :books, :published_in
  	add_column :books, :published_in, :integer
  end
end
