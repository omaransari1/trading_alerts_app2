class PagesController < ApplicationController
  def home
    conn = Faraday.new(:url => 'https://www.alphavantage.co') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get '/query?function=TIME_SERIES_DAILY&symbol=AAPL&apikey=JG3NSS22E1GK9BB5'

    @apple = response.body
    @parsed_apple = JSON.parse @apple
     @todays_close = @parsed_apple["Time Series (Daily)"]["2017-08-02"]["4. close"]

    render 'home'
  end
end
