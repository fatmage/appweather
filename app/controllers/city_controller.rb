require 'net/http'
require 'json'

class CityController < ApplicationController

    def index
     #   @cities = City.all
    end

    def kelvin_to_celsius(f)
        return (f-273.15).round(1)
    end

    def show_city

        uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?q=#{params[:city]}&appid=#{Rails.application.credentials.dig(:open_weather, :appid)}")
        @res = JSON.parse(Net::HTTP.get(uri))

        if @res.empty?
            @temp = "Error"

            #@wind = @res['wind']['speed']
            #@humidity = @res['main']['humidity']
            #@clouds = @res['clouds']['all']
            @icon = @res['weather'][0]['icon'] 
            
   
        else
            @temp = kelvin_to_celsius(@res['main']['temp'])
            @desc = @res['weather'][0]['description'].capitalize
            #@wind = @res['wind']['speed']
            #@humidity = @res['main']['humidity']
            #@clouds = @res['clouds']['all']
            @icon = @res['weather'][0]['icon'] 
        end
 


    end

end
