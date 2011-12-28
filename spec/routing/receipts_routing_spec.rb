require "spec_helper"

describe IncomesController do
  describe "routing" do

    it "routes to #index" do
      get("/incomes").should route_to("incomes#index")
    end

    it "routes to #new" do
      get("/incomes/new").should route_to("incomes#new")
    end

    it "routes to #show" do
      get("/incomes/1").should route_to("incomes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/incomes/1/edit").should route_to("incomes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/incomes").should route_to("incomes#create")
    end

    it "routes to #update" do
      put("/incomes/1").should route_to("incomes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/incomes/1").should route_to("incomes#destroy", :id => "1")
    end

  end
end
