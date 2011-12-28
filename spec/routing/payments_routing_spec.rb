require "spec_helper"

describe ExpensesController do
  describe "routing" do

    it "routes to #index" do
      get("/expenses").should route_to("expenses#index")
    end

    it "routes to #new" do
      get("/expenses/new").should route_to("expenses#new")
    end

    it "routes to #show" do
      get("/expenses/1").should route_to("expenses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/expenses/1/edit").should route_to("expenses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/expenses").should route_to("expenses#create")
    end

    it "routes to #update" do
      put("/expenses/1").should route_to("expenses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/expenses/1").should route_to("expenses#destroy", :id => "1")
    end

  end
end
