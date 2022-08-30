require 'net/http'
require 'json'

class CityController < ApplicationController

    def index
     #   @cities = City.all
    end

    def show_city

        uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?q=#{params[:city]}&appid=#{Rails.application.credentials.open_weather[:appid]}")
        @res = JSON.parse(Net::HTTP.get(uri))

        if @res.empty?
            @temp = 123

            #@wind = @res['wind']['speed']
            #@humidity = @res['main']['humidity']
            #@clouds = @res['clouds']['all']
            @icon = @res['weather'][0]['icon'] 
            
   
        else
            @temp = @res['main']['temp']
            #@wind = @res['wind']['speed']
            #@humidity = @res['main']['humidity']
            #@clouds = @res['clouds']['all']
            @icon = @res['weather'][0]['icon'] 
        end
 


    end

end
