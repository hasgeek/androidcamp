require "spec_helper"

describe TalksController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/talks" }.should route_to(:controller => "talks", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/talks/new" }.should route_to(:controller => "talks", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/talks/1" }.should route_to(:controller => "talks", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/talks/1/edit" }.should route_to(:controller => "talks", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/talks" }.should route_to(:controller => "talks", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/talks/1" }.should route_to(:controller => "talks", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/talks/1" }.should route_to(:controller => "talks", :action => "destroy", :id => "1")
    end

  end
end
