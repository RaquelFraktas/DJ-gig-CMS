class PromotersController < ApplicationController

  # GET: /booking_agents
  get "/promoters" do
    if logged_in?
      promoter = Promoter.find(session[:user_id])
      redirect to"/promoters/#{promoter.id}"
    end
    erb :"/promoters/index"
  end

  # GET: /booking_agents/new
  get "/promoters/signup" do
    erb :"/promoters/new"
  end

  # POST: /booking_agents
  post "/promoters" do
    promoter = Promoter.find_by(username: params[:promoter][:username])
    if promoter && promoter.authenticate(params[:promoter][:password])
      session[:user_id] = promoter.id
      session[:message] = "Successfully logged in."
      flash[:success] = session[:message] 
      redirect "/promoters/#{promoter.id}"
    end
    redirect "/error"
  end

  # GET: /booking_agents/5
  get "/promoters/:id" do
    redirect_if_not_logged_in
    @promoter = Promoter.find(session[:user_id])
    erb :"/promoters/show"
  end


  post "/promoters/signup" do
    @promoter = Promoter.create(params[:promoter])
    if @promoter
      session[:user_id] = @promoter.id
      @promoter.gig_ids = params[:gigs]
      if !params[:gig][:name].empty? && !Gig.find_by(name: params[:gig][:name])
        @new_gig = Gig.create(name: params[:gig][:name])
        @promoter.gigs << @new_gig
      end
      @promoter.save
      redirect "/promoters/#{@promoter.id}"
    end
    redirect "/error"
  end


  # GET: /booking_agents/5/edit
  get "/promoters/:id/edit" do
    redirect_if_not_logged_in
      @promoter = Promoter.find(params[:id])
      erb :"/djs/edit"
  end

  # PATCH: /booking_agents/5
  patch "/promoters/:id" do
    @promoter = Dj.find(params[:id])
    @promoter.name = params[:dj][:name]
    @promoter.based_in = params[:dj][:based_in]
    @promoter.bio = params[:dj][:bio]
    @promoter.genre_ids = params[:genres]
    if !params[:gig][:name].empty? && !Gig.find_by(name: params[:gig][:name])
      @new_gig = Gig.create(name: params[:gig][:name])
      @promoter.gigs << @new_gig
    end
    @promoter.save
    redirect "/promoters/#{@promoter.id}"
  end

  # DELETE: /booking_agents/5/delete
  delete "/promoters/:id/delete" do
    session.clear
    @promoter = Promoter.find(params[:id])
    @Promoter.delete
    flash[:message] = "You have successfully deleted your account."
    redirect "/logout"
  end
end
