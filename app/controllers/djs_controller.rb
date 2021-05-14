class DjsController < ApplicationController
  

    get "/djs" do
      erb :"/djs/index"
    end
  
    get "/djs/new" do
      erb :"/djs/new"
    end
  
    post "/djs" do
      @session = session
      @dj = Dj.find_by(username: params[:username], password_digest: params[:password])
      if @user
        @session[:user_id] = @dj.id
        redirect '/djs/:id'
      end
      redirect "/error"
    end

    post "/djs/new" do
      @new_dj = DJ.create(params)
      if @new_dj
        session[:user_id] = @new_dj.id
        redirect '/djs/:id'
      end
    end
  
    get "/djs/:id" do
      @user = Dj.find_by(params[:id])
      
      erb :"/djs/show"
    end
  
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

    post "/djs/logout" do
      flash[:message] = "Successfully logged out."
      redirect to "/"
    end

  end
  