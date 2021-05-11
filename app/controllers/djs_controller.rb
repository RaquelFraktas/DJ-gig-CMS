class DjsController < ApplicationController

    # GET: /gigs
    get "/djs" do
      erb :"/djs/index"
    end
  
    # GET: /gigs/new
    get "/djs/new" do
      erb :"/djs/new"
    end
  
    # POST: /gigs
    post "/djs" do
      redirect "/djs"
    end
  
    # GET: /gigs/5
    get "/djs/:id" do
      erb :"/djs/show"
    end
  
    # GET: /gigs/5/edit
    get "/djs/:id/edit" do
      erb :"/djs/edit"
    end
  
    # PATCH: /gigs/5
    patch "/gigs/:id" do
      redirect "/gigs/:id"
    end
  
    # DELETE: /gigs/5/delete
    delete "/gigs/:id/delete" do
      redirect "/gigs"
    end
  end
  