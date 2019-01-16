require 'robinhood-ruby'
require './helpers'

email = ENV['RH_EMAIL']
password = ENV['RH_PW']
client_id = ENV['CID']

@robinhood = Robinhood::REST::Client.new(email, password, client_id)
res = @robinhood.quote_data('VTI')
latest_timestamp = res["results"][0]["updated_at"]
puts res["results"][0]

while 1
  res = @robinhood.quote_data('VTI')
  new_timestamp = res["results"][0]["updated_at"]
  if latest_timestamp != new_timestamp
    latest_timestamp = new_timestamp
    puts res["results"][0]
  end
end