class DjsController < ApplicationController
  

    get "/djs" do
      erb :"/djs/index"
    end
  
    get "/djs/signup" do
      erb :"/djs/new"
    end
  
    post "/djs" do
      @session = session
      @dj = Dj.find_by(username: params[:username], password: params[:password])
      if @user
        @session[:user_id] = @dj.id
        redirect '/djs/:id'
      end
      redirect "/error"
    end


    get "/djs/:id" do
      @dj = Dj.find_by(session[:user_id])
      
      erb :"/djs/show"
    end


    post "/djs/signup" do
      # puts params[:dj][:name]
  
      @new_dj = Dj.new(params[:dj])
      @new_dj.save

      if @new_dj
        session[:user_id] = @new_dj.id
       
        if !params[:genre][:name].empty? && params[:genre][:name]!= Genre.find_by(name: params[:genre][:name])
          @new_genre = Genre.create(params[:genre])
          @new_dj.genres << @new_genre
        elsif !params[:genre][:name].empty?
          genres = params[:genre]
          @new_dj.genres << genres
        end
        
        redirect "/djs/#{@new_dj.id}"
      end
      redirect "/error"
    end
  
 
  
    get "/djs/:id/edit" do
      erb :"/djs/edit"
    end
  
    # PATCH: /djs/5
    patch "/djs/:id" do
      redirect "/djs/:id"
    end
  
    delete "/djs/:id/delete" do
      redirect "/djs"
    end

    post "/djs/logout" do
      flash[:message] = "Successfully logged out."
      redirect to "/logout"
    end

  end
  