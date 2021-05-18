class DjsController < ApplicationController
  

    get "/djs" do
      if logged_in?
        dj = Dj.find(session[:user_id])
        redirect to"/djs/#{dj.id}"
      end
      erb :"/djs/index"
    end
  
    get "/djs/signup" do
      erb :"/djs/new"
    end
  
    post "/djs" do
      dj = Dj.find_by(username: params[:dj][:username])
      if dj && dj.authenticate(params[:dj][:password])
        session[:user_id] = dj.id
        session[:message] = "Successfully logged in."
        flash[:success] = session[:message] 
        redirect "/djs/#{dj.id}"
      end
      redirect "/error"
    end


    get "/djs/:id" do
      redirect_if_not_logged_in
      @dj = Dj.find(session[:user_id])
      erb :"/djs/show"
    end


    post "/djs/signup" do
      @dj = Dj.create(params[:dj])
      if @dj
        session[:user_id] = @dj.id
        @dj.genre_ids = params[:genres]
        if !params[:genre][:name].empty? && !Genre.find_by(name: params[:genre][:name])
          @new_genre = Genre.create(name: params[:genre][:name])
          @dj.genres << @new_genre
        end
        @dj.save
        redirect "/djs/#{@dj.id}"
      end
      redirect "/error"
    end
  
    get "/djs/:id/edit" do
      redirect_if_not_logged_in
      @dj = Dj.find(params[:id])
      erb :"/djs/edit"
    end
  
    patch "/djs/:id" do
      @dj = Dj.find(params[:id])
      @dj.name = params[:dj][:name]
      @dj.based_in = params[:dj][:based_in]
      @dj.bio = params[:dj][:bio]
      @dj.genre_ids = params[:genres]
      if !params[:genre][:name].empty? && !Genre.find_by(name: params[:genre][:name])
        @new_genre = Genre.create(name: params[:genre][:name])
        @dj.genres << @new_genre
      end
      @dj.save
      redirect "/djs/#{@dj.id}"
    end
  
    delete "/djs/:id" do
      session.clear
      @dj = Dj.find(params[:id])
      @dj.delete
      flash[:message] = "You have successfully deleted your account."
      redirect to "/logout"
    end

    post "/djs/logout" do
      flash[:message] = "Successfully logged out."
      redirect to "/logout"
    end
  end
  