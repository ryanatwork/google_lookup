require 'sinatra'
require 'haml'
require 'google-civic'

get '/' do
  haml :index
end

get '/lookup' do
  @client = GoogleCivic.new(:key => ENV['google_key'])
  @info = @client.voter_info(4000, params[:address])
  haml :lookup
end

