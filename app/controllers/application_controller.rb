require './config/environment'

class ApplicationController < Sinatra::Base
  

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
    register Sinatra::Flash
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

    def dj_current_user
      logged_in? && Dj.find(session[:user_id])
    end
  
    def promoter_current_user
      logged_in? && Promoter.find(session[:user_id])
    end

    def redirect_if_not_logged_in
      if !logged_in?
          redirect '/error'
      end
    end
  end

end
