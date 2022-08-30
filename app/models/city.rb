require 'net/http'
require 'json'


class City < ApplicationRecord
    before_save   :downcase_name 
    before_c
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :date, presence: true


    def get_weather
        api_key = Rails.application.credentials.open_weather_map[:api_key]

        uri = URI("http://api.openweathermap.org/data/2.5/weather?q=#{URI.encode(@name)}&appid=#{api_key}")
    
        # Download and parse the JSON from the api
        res = JSON.parse(Net::HTTP.get(uri))

    end


    private
    def capitalise_name
      name.capitalise!
    end

    def generate_timestamp
        self.timestamp = Date.today.to_date
    end



end