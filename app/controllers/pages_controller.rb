class PagesController < ApplicationController
  def home

    @stocks = Stock.all

    @closing_prices_arr = []

         

      conn = Faraday.new(:url => 'https://www.alphavantage.co') do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

    @stocks.each do |stock|
      response = conn.get "/query?function=TIME_SERIES_DAILY&symbol=#{stock.symbol}&outputsize=full&apikey=JG3NSS22E1GK9BB5"

      @response = response.body
      @parsed_response = JSON.parse @response
      @closing_prices_arr << @parsed_response["Time Series (Daily)"]["2017-08-02"]["4. close"]
    end


    render 'home'
  end
end
