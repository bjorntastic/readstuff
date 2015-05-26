class User < ActiveRecord::Base
	validates :fav_author, presence: true
	validates :fav_genre, presence: true
	
end
