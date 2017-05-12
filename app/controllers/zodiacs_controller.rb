class ZodiacsController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'

  before_action :current_user

  def new
    @users = User.all
    puts params.inspect
    # @zodiac_name=Zodiac.find(params[:id])

    # set url to read
    url = "http://horoscope-api.herokuapp.com/horoscope/today/"
    url=url+params[:id]

    # encode URI using the URI constant
    uri = URI(url)

    # tell Net::HTTP to POST the URI
    response = Net::HTTP.get(uri) # => String
    # response.basic_auth uid, apikey

    @prediction=JSON.parse(response)
    if current_user
      @user_comment = Journal.new(user_id: "#{current_user.id}")
      puts "see me"
      puts current_user.id
    end
  end
end
