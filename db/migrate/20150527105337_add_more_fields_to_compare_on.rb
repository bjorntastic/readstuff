class AddMoreFieldsToCompareOn < ActiveRecord::Migration
  def change
  	add_column :books, :pages, :integer
  	add_column :users, :pages, :integer

  	add_column :books, :level, :integer
  	add_column :users, :level, :string

  	add_column :books, :mood, :integer
  	add_column :users, :mood, :string

  end
end
