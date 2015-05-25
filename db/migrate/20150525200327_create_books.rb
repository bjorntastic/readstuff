class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :genre
      t.string :author
      t.float :price
      t.datetime :published_in
      t.timestamps null: false
    end
  end
end
