class MoviesController < ApplicationController

    def create
        @movie = Movie.new(movie_params)

        hash = ImdbService.new
        
        @movie.title = hash.get_title_by_actor("Gary Busey")
        @movie.year = hash.get_year_by_actor("Gary Busey")

    end

end