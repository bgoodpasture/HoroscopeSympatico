class HoroApisController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'

  def new
    puts params.inspect
    @zodiac_name=params[:id]

    # set url to read
    url = "http://horoscope-api.herokuapp.com/horoscope/today/"
    url=url+@zodiac_name

    # encode URI using the URI constant
    uri = URI(url)

    # tell Net::HTTP to POST the URI
    response = Net::HTTP.get(uri) # => String
    # response.basic_auth uid, apikey

    @prediction=JSON.parse(response)
  end
end
