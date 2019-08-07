require 'rails_helper'

# RSpec.describe V1::UsersController do
#   let!(:user) { create(:user) }
#   let!(:operation) { create(:operation, user: user) }
#
#   before { create_list(:operation, 4, user: user) }
#
#   describe "POST #create" do
#     context 'when valid account' do
#       # before do
#       #   post '/v1/users', params: { name: 'New user' }
#       # end
#
#       it do
#         expect(response).to be_ok
#
#         expect { post :create, params: { user: { name: 'New user' } } }.to change(User, :count).by(1)
#       end
#     end
#   end
# end

require 'rails_helper'
describe "post a question route", :type => :request do
  before do
    post '/v1/users', params: { user: { :name => 'test_user' } }
  end
  it 'returns a created status' do
    expect(response).to have_http_status(:ok)
  end
end
