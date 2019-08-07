require 'rails_helper'

RSpec.describe V1::UsersController do
  let!(:user) { create(:user) }
  let!(:operation) { create(:operation, user: user) }

  before { create_list(:operation, 4, user: user) }

  describe "GET #index" do
    before do
      get :index
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "JSON body response contains expected recipe attributes" do
      json_response = JSON.parse(response.body)

      expect(json_response[0]['id']).to be_present
      expect(json_response[0]['name']).to be_present
      expect(json_response[0]['balance']).to be_present
    end
  end
end
