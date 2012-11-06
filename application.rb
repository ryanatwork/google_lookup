require 'sinatra'
require 'haml'
require 'google-civic'

get '/' do
  haml :index
end

get '/lookup' do
  @client = GoogleCivic.new(:key => ENV['GOOGLE_KEY'])
  @info = @client.voter_info(4000, params[:address])

  if @info.normalizedInput.nil?
    haml :no_address
  else
    haml :lookup
  end
end

