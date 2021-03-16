require 'rails_helper'

RSpec.describe "Statics", type: :request do
  describe "GET /lookalikes_show" do
    it "returns http success" do
      get "/static/lookalikes_show"
      expect(response).to have_http_status(:success)
    end
  end

end
