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

  get "/logout" do
    session.clear
    redirect "/"
  end


  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user(session)
      logged_in? && Dj.find(session[:user_id])
    end
  end

end
