require "rails_helper"

RSpec.describe LookALikesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/look_a_likes").to route_to("look_a_likes#index")
    end

    it "routes to #new" do
      expect(get: "/look_a_likes/new").to route_to("look_a_likes#new")
    end

    it "routes to #show" do
      expect(get: "/look_a_likes/1").to route_to("look_a_likes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/look_a_likes/1/edit").to route_to("look_a_likes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/look_a_likes").to route_to("look_a_likes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/look_a_likes/1").to route_to("look_a_likes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/look_a_likes/1").to route_to("look_a_likes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/look_a_likes/1").to route_to("look_a_likes#destroy", id: "1")
    end
  end
end
