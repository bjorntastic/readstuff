module BooksHelper

	def genre_options
		['Biography', 'Tragedy', 'Fantasy', 'Sci-Fi', 'Comedy', "Drama", "Poetry", "Business", "Science"]
	end

	def level_options
		{
			'Extremely Easy' => 10,
			'Easy' => 30,
			'Medium' => 50,
			'Challenge' => 70,
			'Academic Paper' => 90
		}
	end

	def mood_options
		{
			'On top of the world!' => 0,
			'Really good' => 20,
			'Fine' => 40,
			'Could feel better' => 60,
			'Not great' => 80,
			'Sad' => 100
		}
	end

	def pages_options
		{
			'Very short' => 10,
			'Short' => 30,
			'Medium' => 50,
			'Long' => 70,
			'Epic' => 90
		}
	end

end
