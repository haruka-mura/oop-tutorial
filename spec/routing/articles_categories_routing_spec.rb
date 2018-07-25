require "rails_helper"

RSpec.describe ArticlesCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/articles_categories").to route_to("articles_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/articles_categories/new").to route_to("articles_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/articles_categories/1").to route_to("articles_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/articles_categories/1/edit").to route_to("articles_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/articles_categories").to route_to("articles_categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/articles_categories/1").to route_to("articles_categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/articles_categories/1").to route_to("articles_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/articles_categories/1").to route_to("articles_categories#destroy", :id => "1")
    end

  end
end
