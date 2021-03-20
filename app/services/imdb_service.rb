require "http"
require 'json'


class ImdbService

    def get_title_by_actor(actor)
        response = HTTP.get("http://www.ombapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&a=#{actor}").to_s
        parsed_response = JSON.parse(response)
        parsed_response["Title"]
    end

end