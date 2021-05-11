class BookingAgentsController < ApplicationController

  # GET: /booking_agents
  get "/booking_agents" do
    erb :"/booking_agents/index"
  end

  # GET: /booking_agents/new
  get "/booking_agents/new" do
    erb :"/booking_agents/new"
  end

  # POST: /booking_agents
  post "/booking_agents" do
    redirect "/booking_agents"
  end

  # GET: /booking_agents/5
  get "/booking_agents/:id" do
    erb :"/booking_agents/show"
  end

  # GET: /booking_agents/5/edit
  get "/booking_agents/:id/edit" do
    erb :"/booking_agents/edit"
  end

  # PATCH: /booking_agents/5
  patch "/booking_agents/:id" do
    redirect "/booking_agents/:id"
  end

  # DELETE: /booking_agents/5/delete
  delete "/booking_agents/:id/delete" do
    redirect "/booking_agents"
  end
end
