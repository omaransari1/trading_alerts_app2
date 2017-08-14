class PagesController < ApplicationController
  def home

    @stocks = Stock.all

    @closing_prices_arr = []

         

      conn = Faraday.new(:url => 'https://www.quandl.com') do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

    # @stocks.each do |stock|  **replace MSFT with #{stock.symbol} for loop
      response = conn.get "/api/v3/datasets/WIKI/MSFT.json?limit=50&apikey=hMsC5ogvjGQTiy5eYTsR"

      @response = response.body
      @parsed_response = JSON.parse @response

      @daily_close = @parsed_response["dataset"]["data"][0][4]

      # @closing_prices_arr << @parsed_response["Time Series (Daily)"]["2017-08-02"]["4. close"]
    # end


    render 'home'
  end
end
