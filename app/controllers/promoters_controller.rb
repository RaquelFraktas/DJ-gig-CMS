class PromotersController < ApplicationController


  get "/promoters" do
    if promoter_logged_in?
      promoter = Promoter.find(session[:promoter_user_id])
      redirect to"/promoters/#{promoter.id}"
    else
      session.clear
    end
    erb :"/promoters/index"
  end

  get "/promoters/signup" do
    erb :"/promoters/new"
  end

  post "/promoters" do
    promoter = Promoter.find_by(username: params[:promoter][:username])
    if promoter && promoter.authenticate(params[:promoter][:password])
      session[:promoter_user_id] = promoter.id
      flash[:message] = "Successfully logged in."
      redirect "/promoters/#{promoter.id}"
    end
    flash[:message]= "Invalid credentials"
    redirect "/error"
  end

  get "/promoters/:id" do
    promoter_redirect_if_not_logged_in
    @promoter = Promoter.find(session[:promoter_user_id])
    erb :"/promoters/show"
  end

  post "/promoters/signup" do
    @promoter = Promoter.create(params[:promoter])
    @promoter.name = @promoter.name.capitalize
    @promoter.based_in = @promoter.based_in.capitalize
    if !@promoter.valid?
      flash[:message] = "The credentials are invalid. Please create a unique username, and a password longer than 6 characters."
      redirect to "/error"
    else 
      session[:promoter_user_id] = @promoter.id
      @promoter.save
      redirect "/promoters/#{@promoter.id}"
    end
    redirect "/error"
  end

  get "/promoters/:id/edit" do
    promoter_redirect_if_not_logged_in
      @promoter = Promoter.find(params[:id])
      erb :"/promoters/edit"
  end

  patch "/promoters/:id" do
    @promoter = Promoter.find(params[:id])
    @promoter.name = params[:promoter][:name]
    @promoter.based_in = params[:promoter][:based_in]
    @promoter.bio = params[:promoter][:bio]
    if !params[:gig][:name].empty? && !Gig.find_by(name: params[:gig][:name])
      @new_gig = Gig.create(params[:gig])
      @new_gig.name = @new_gig.name.capitalize
      @promoter.gigs << @new_gig
    end
    @promoter.save
    redirect "/promoters/#{@promoter.id}"
  end

  delete "/promoters/:id/delete" do
    session.clear
    @promoter = Promoter.find(params[:id])
    @promoter.delete
    flash[:message] = "You have successfully deleted your account."
    redirect to "/logout"
  end
end
