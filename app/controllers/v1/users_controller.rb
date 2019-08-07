module V1
  class UsersController < ApplicationController
    def index
      users = User.all
      render json: users
    end

    def create
      user = User.new(user_params)
      if @user.save
        render json: user
      else
        payload = {
          error: 'Internal Server Error',
          status: 500
        }
        render :json => payload, :status => :bad_request
      end
    end

    private

    def user_params
      params.require(:user).permit(:name)
    end
  end
end

