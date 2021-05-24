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
    flash[:message]
    session.clear
    redirect "/"
  end

  get "/contact" do
  
    erb :contact
  end


  helpers do

    def dj_logged_in?
      !!session[:dj_user_id]
    end

    def promoter_logged_in?
      !!session[:promoter_user_id]
    end

    def dj_current_user
      dj_logged_in? && Dj.find(session[:dj_user_id])
    end
  
    def promoter_current_user
      promoter_logged_in? && Promoter.find(session[:promoter_user_id])
    end

    def dj_redirect_if_not_logged_in
      if !dj_logged_in?
          redirect '/error'
      end
    end
    
    def promoter_redirect_if_not_logged_in
      if !promoter_logged_in?
          redirect '/error'
      end
    end

  end

end
