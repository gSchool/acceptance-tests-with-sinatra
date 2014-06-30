require 'sinatra'

class SampleApp < Sinatra::Base

  get "/" do
    erb :home
  end

  get "/profile" do
    erb :profile
  end

end