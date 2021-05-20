class GigsController < ApplicationController

  # GET: /gigs
  get "/gigs" do
    erb :"/gigs/index"
  end

  # GET: /gigs/new
  get "/gigs/new" do

    erb :"/gigs/new"
  end

  # POST: /gigs
  post "/gigs" do
    @gig = Gig.create(params[:gig])
    @gig.name = @gig.name.capitalize
    @gig.venue = @gig.venue.capitalize
    @gig.city = @gig.city.capitalize
    @gig.promoter = promoter_current_user
    @gig.save

    redirect "/gigs"
  end

  # GET: /gigs/5
  get "/gigs/:id" do
    @gig = Gig.find(params[:id])
    erb :"/gigs/show"
  end

  # GET: /gigs/5/edit
  get "/gigs/:id/edit" do
    promoter_redirect_if_not_logged_in
    @gig = Gig.find(params[:id])
    erb :"/gigs/edit"
  end

  # PATCH: /gigs/5
  patch "/gigs/:id" do
    if !params[:gig].empty?
      @gig = Gig.find(params[:id])
      @gig.name = params[:gig][:name]
      @gig.venue = params[:gig][:venue]
      @gig.city = params[:gig][:city]
    end
    @gig.save
    redirect "/gigs/:id"
  end

  # DELETE: /gigs/5/delete
  delete "/gigs/:id/delete" do
    @gig = Gig.find(params[:id])
    @gig.delete
    flash[:message] = "You have successfully deleted your gig."
    redirect to "/gigs"
  end
end
