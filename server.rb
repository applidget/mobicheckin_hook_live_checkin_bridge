# server.rb
require 'sinatra'
require 'httparty'

API_AUTH_TOKEN = ENV["MOBICHECKIN_AUTH_TOKEN"]
#HOST = "https://app.mobicheckin.com"
#HOST = "http://localhost:5000"
HOST = ENV["MOBICHECKIN_HOST"]

metadatas = ["email", "uid", "order_uid", "first_name", "last_name", "company_name", "position", "phone_number", "message"]

post "/events/:target_event_id/guest_categories/:guest_category_id/guests/handle_hook" do |target_event_id, guest_category_id|
  parameters = JSON.parse(request.body.read)
  guest = parameters["guest"]

  options = {"guest_category_id" => guest_category_id}
  metadatas.each do |metadata_name|
    options.merge!(metadata_name => guest[metadata_name]) unless guest[metadata_name].nil?
  end

  response = HTTParty.post("#{HOST}/api/v1/events/#{target_event_id}/guests.json?auth_token=#{API_AUTH_TOKEN}", :body => {"guest" => options})

  if response.code == 201
    puts "API Call 201 - Guest added to event #{target_event_id}"
  elsif response.code == 422
    puts "API Call 422 - #{response.parsed_response['errors']}"
  else
    puts "API Call #{response.code}"
  end

end
