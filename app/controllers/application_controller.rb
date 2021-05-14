require './config/environment'

class ApplicationController < Sinatra::Base
  

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    use Rack::Flash
    set :session_store, Rack::Session::Pool
  end

  

  get "/" do
    erb :welcome
  end

  get "/error" do
    erb :error
  end


  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      logged_in? && User.find(session[:user_id])
    end
  end

end
