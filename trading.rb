require 'robinhood-ruby'

email = ENV['RH_EMAIL']
password = ENV['RH_PW']
client_id = ENV['CID']

@robinhood = Robinhood::REST::Client.new(email, password, client_id)

while 1
  res = @robinhood.quote_data('AAPL')
  puts res["results"][0]["last_trade_price"]
end