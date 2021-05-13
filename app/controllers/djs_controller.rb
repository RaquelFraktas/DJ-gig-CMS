class DjsController < ApplicationController


    get "/djs" do
      erb :"/djs/index"
    end
  
    get "/djs/new" do
      erb :"/djs/new"
    end
  
    post "/djs" do
      @user = Dj.find_or_create_by(params)
      if @user
        session[:user_id] = @user.id
        redirect '/djs/:id'
      end
      #put an error message if login unsuccessful
      redirect "/error"
    end
  
    get "/djs/:id" do
      @user = Dj.find_by(params[:id])
      
      erb :"/djs/show"
    end
  
    # GET: /djs/5/edit
    get "/djs/:id/edit" do
      erb :"/djs/edit"
    end
  
    # PATCH: /djs/5
    patch "/djs/:id" do
      redirect "/djs/:id"
    end
  
    # DELETE: /djs/5/delete
    delete "/djs/:id/delete" do
      redirect "/djs"
    end
  end
  