class BooksController < ApplicationController

	def welcome
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:fav_author, :fav_genre, :age, :email))
		if @user.save
			render 'success'
		else
			render 'welcome'
		end
	end

end
