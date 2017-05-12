class ZodiacsController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'

  before_action :current_user
  before_action :pred_id_lookup

  def new
    puts params.inspect
    # @zodiac_name=Zodiac.find(params[:id])

    # set url to read
    url = "http://horoscope-api.herokuapp.com/horoscope/today/"
    url=url+params[:id]

    # encode URI using the URI constant
    uri = URI(url)

    # tell Net::HTTP to GET the URI
    response = Net::HTTP.get(uri) # => String

    @prediction=JSON.parse(response)
    if current_user
      # @predict = Predict.new(user_id: "#{current_user.id}")
      # @predict = Predict.new(user_id: "#{current_user["id"]}")
      puts "see me"
      puts current_user.id
    end
  end

  def show
    redirect_to "/"
  end

  def do_daily_all_predicts
    #  Test in console using- ZodiacsController.new.do_daily_all_predicts()
    @zodiacs=Zodiac.all
    @zodiacs.each do |z|
      url = "http://horoscope-api.herokuapp.com/horoscope/today/"
      url=url+z.sign
      uri = URI(url)
      response = Net::HTTP.get(uri) # => String
      @prediction=JSON.parse(response)
      # puts "DATE- #{@prediction["date"]}"
      # puts "ID- #{z.id}"
      # puts "HORO- #{@prediction["horoscope"]}"
      @predict = Predict.create(
        pred_date: "#{@prediction["date"]}",
        zodiac_id: z.id,
        prediction: "#{@prediction["horoscope"]}"
      )
    end
  end

  def pred_id_lookup
    @zodiacs=Zodiac.all
    # @zodiac.build_journal
    @zodiac=Zodiac.where(id: params[:sunsign]).first
    puts "ID- #{@zodiac}"
    puts params[:sunsign]
    @pred_id=Predict.where(pred_date: params[:date], zodiac_id: "6").first
  end
end
