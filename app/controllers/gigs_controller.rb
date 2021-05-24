class GigsController < ApplicationController

  get "/gigs" do
    erb :"/gigs/index"
  end

  get "/gigs/new" do

    erb :"/gigs/new"
  end

  post "/gigs" do
    @gig = Gig.create(params[:gig])
    @gig.name = @gig.name.capitalize
    @gig.venue = @gig.venue.capitalize
    @gig.city = @gig.city.capitalize
    @gig.promoter = promoter_current_user
    @gig.save
    redirect "/gigs"
  end

  get "/gigs/:id" do
    if !Gig.exists?(params[:id])
      redirect "/error"
    else
      @gig = Gig.find(params[:id])
    end
    erb :"/gigs/show"
  end

  get "/gigs/:id/edit" do
    promoter_redirect_if_not_logged_in
    @gig = Gig.find(params[:id])
    erb :"/gigs/edit"
  end


  patch "/gigs/:id" do
    if !params[:gig].empty?
      @gig = Gig.find(params[:id])
      @gig.name = params[:gig][:name]
      @gig.venue = params[:gig][:venue]
      @gig.city = params[:gig][:city]
      @gig.dj_ids = params[:djs]
      if !@gig.dj_ids.empty?
        @gig.dj_ids do |dj|
          dj.gigs<< @gig
        end
      end
    end
    @gig.save
    redirect "/gigs/#{@gig.id}"
  end

  delete "/gigs/:id/delete" do
    @gig = Gig.find(params[:id])
    @gig.delete
    flash[:message] = "You have successfully deleted your gig."
    redirect "/gigs"
  end

end
