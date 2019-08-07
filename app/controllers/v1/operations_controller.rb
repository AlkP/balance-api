module V1
  class OperationsController < ApplicationController
    def index
      operations = Operation.where(user_id: params[:user_id])
      render json: operations
    end

    def create
      begin
        user = User.find(operation_params[:user_id])
        user.balance += operation_params[:price].to_d
        operation = Operation.new(operation_params)

        ActiveRecord::Base.transaction do
          user.save
          operation.save
        end
      rescue ActiveRecord::RecordInvalid => exception
        payload = {
          error: exception.message,
          status: 500
        }
        render :json => payload, :status => :bad_request
      end
    end

    private

    def operation_params
      params.require(:operation).permit(:user_id, :price)
    end
  end
end

