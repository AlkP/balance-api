require 'rails_helper'

describe "post a question route", :type => :request do
  let(:user) { create(:user) }
  before do
    post '/v1/operations', params: { operation: { user_id: user.id, price: '0.123' } }
  end
  it 'returns a created status' do
    expect(response).to have_http_status(:no_content)
  end
end
