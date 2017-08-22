class PagesController < ApplicationController
  def home

    @stocks = Stock.all

    @closing_prices_arr = []

         

      conn = Faraday.new(:url => 'https://www.quandl.com') do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

<<<<<<< HEAD
    @stocks.each do |stock|
      response = conn.get "/query?function=TIME_SERIES_DAILY&symbol=#{stock.symbol}&outputsize=full&apikey=YMLLXVLX6UQ6SBEM"
=======
    response = conn.get "/api/v3/datasets/WIKI/AAPL.json?limit=50&apikey=hMsC5ogvjGQTiy5eYTsR"
>>>>>>> 9fb0e73af81b0aea035ddf3f208e2262841abc7d

    @response = response.body
    @parsed_response = JSON.parse @response

    @daily_close = @parsed_response["dataset"]["data"][0][11]


    #50 day moving average calculation
    @fifty_day_sum = 0
    for i in (0..49)
      @fifty_day_sum += @parsed_response["dataset"]["data"][i][11].to_f
    end
    @fifty_day_MA = @fifty_day_sum / 50



    render 'home'
  end
end
