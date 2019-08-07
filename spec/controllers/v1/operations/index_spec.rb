require 'rails_helper'

RSpec.describe V1::OperationsController do
  let!(:user) { create(:user) }
  before { create_list(:operation, 4, user: user) }
  before { get :index, params: { user_id: user.id } }

  describe "GET #index" do
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "JSON body response contains expected recipe attributes" do
      json_response = JSON.parse(response.body)

      expect(json_response.count).to eq(4)
    end
  end
end
