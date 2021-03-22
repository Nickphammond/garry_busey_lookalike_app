class MoviesController < ApplicationController
    before_action :set_movies, only: [:index]

    require 'uri'
    require 'net/http'
    require 'openssl'
    require 'json'



            


    

    def index
    end



    def add_movie
        
    end

 


    private

    def set_movies
        url = URI("https://imdb8.p.rapidapi.com/actors/get-all-filmography?nconst=nm0000997")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = AUTH_DETAILS["IMDB_API_KEY"]
        request["x-rapidapi-host"] = AUTH_DETAILS["IMDB_API_HOST"]

        response = http.request(request)
        @movies = JSON.parse(response.read_body)["filmography"]


    end

end
