# coding: utf-8
require 'net/http'
require 'json'
require 'time'

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

        if @res
            @temp = kelvin_to_celsius(@res['main']['temp']).to_s + "℃"
            @desc = @res['weather'][0]['description'].capitalize
            @location = params[:city].capitalize + ", " + @res['sys']['country']
            @time = Time.now.strftime("%A, %d %B")

            @secondary = []
            @secondary += [{:text => "High", :val => @res['main']['temp_max']}]
            @secondary += [{:text => "Wind", :val => @res['wind']['speed']}]
            @secondary += [{:text => "Sunrise", :val => Time.at(@res['sys']['sunrise']).to_datetime.strftime('%I:%M:%S %p')}]
            @secondary += [{:text => "Low",  :val => @res['main']['temp_min']}]
            @secondary += [{:text => "Feels like", :val => kelvin_to_celsius(@res['main']['feels_like']).to_s + "℃"}]
            @secondary += [{:text => "Sunset", :val => Time.at(@res['sys']['sunset']).to_datetime.strftime('%I:%M:%S %p')}]

            @tertiary = []

            @tertiary += [{:text => "Pressure", :val => @res['main']['pressure'].to_s + " hPa"}]
            @tertiary += [{:text => "Humidity", :val => @res['main']['humidity'].to_s + "%"}]
            @tertiary += [{:text => "Visibility", :val => @res['visibility'].to_s + " m"}]
            @tertiary += [{:text => "Wind", :val => @res['wind']['speed'].to_s + " m/s"}]
            @tertiary += [{:text => "Clouds", :val => @res['clouds']['all'].to_s + " %"}]

            if @res['rain']
                @tertiary += [{:text => "Pressure", :val => @res['rain']['1h'].to_s + " last hour"}]
            end
            #@wind = @res['wind']['speed']
            #@humidity = @res['main']['humidity']
            #@clouds = @res['clouds']['all']
            @icon = @res['weather'][0]['icon']          
   
        else

        end
 


    end

end
