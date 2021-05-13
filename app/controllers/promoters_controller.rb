class PromotersController < ApplicationController

  # GET: /booking_agents
  get "/promoters" do
    erb :"/promoters/index"
  end

  # GET: /booking_agents/new
  get "/promoters/new" do
    erb :"/promoters/new"
  end

  # POST: /booking_agents
  post "/promoters" do
    redirect "/promoters"
  end

  # GET: /booking_agents/5
  get "/promoters/:id" do
    erb :"/promoters/show"
  end

  # GET: /booking_agents/5/edit
  get "/promoters/:id/edit" do
    erb :"/promoters/edit"
  end

  # PATCH: /booking_agents/5
  patch "/promoters/:id" do
    redirect "/promoters/:id"
  end

  # DELETE: /booking_agents/5/delete
  delete "/promoters/:id/delete" do
    redirect "/promoters"
  end
end
