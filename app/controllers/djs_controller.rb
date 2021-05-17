class DjsController < ApplicationController
  

    get "/djs" do
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
      @new_dj = Dj.create(params[:dj])
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
      #if you need to change your username, please contact support
      #get password changes to match up
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
      @dj.save
      binding.pry
      # if @dj.authenticate(params[:dj][:password])
    
      #   if params[dj.new_password1] == params[dj.new_password2]
      #   @dj.password = params[dj.new_password1]
      #   binding.pry
      #   end
      # end
      
      redirect "/djs/#{@dj.id}"
    end
  
    delete "/djs/:id/delete" do
      @dj = Dj.find_by_id(params[:id])
      @dj.delete
      flash[:message] = "You have successfully deleted your account."
      redirect "/djs"
    end

    post "/djs/logout" do
      flash[:message] = "Successfully logged out."
      redirect to "/logout"
    end

  end
  