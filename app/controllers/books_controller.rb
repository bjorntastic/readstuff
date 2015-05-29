class BooksController < ApplicationController

	require 'csv'

	def welcome
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:fav_genre, :email, :level, :pages, :mood))
		if @user.save
			@books = Book.all
			@rec = recommender(@user)
			render 'success'
		else
			render 'welcome'
		end
	end

	def recommender(user)
		books = Book.all
		score = Hash.new
		books.each_with_index do |b, index|
			# score for mood
			score[b.title] = (b.mood - user.mood.to_i).abs
			# score for genre
			score[b.title] += 0 if b.genre == user.fav_genre
			score[b.title] += 50 if b.genre != user.fav_genre
			#  score for length of book
			case b.pages
			when 1000..100000
			  score[b.title] += (90 - user.pages.to_i).abs
			when 700..999
			  score[b.title] += (70 - user.pages.to_i).abs
			when 400..699
			  score[b.title] += (50 - user.pages.to_i).abs
			when 100..399
			  score[b.title] += (30 - user.pages.to_i).abs
			when 0..99
			  score[b.title] += (10 - user.pages.to_i).abs
			end
			# score for ease of reading
			score[b.title] += (b.level - user.level.to_i).abs
		end
		# this is sorting the hash by the value before returning
		score.sort_by{|k, v| v}
	end

	def upload
		uploaded_io = params[:books]
		# this saves it in the public dir
		File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), "wb") { |file| file.write(uploaded_io.read)}
		# add items to DB
		@stuff = CSV.foreach(uploaded_io.path, :headers => true) do |row|
			Book.create!(row.to_hash)
		end
	end

	# this is not sued anymore
	def show_stuff
		@show = Array.new
		f = File.open('public/uploads/sample.txt', 'r')
		f.each_line do |line|
			@show << line
		end
	end

end
