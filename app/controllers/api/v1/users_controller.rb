module Api
  module V1
    class UsersController < ApplicationController

      def login
        @user ||= User.where(login: user_params[:username], active: true, status: true).first
        if @user && @user.authenticate(user_params[:password])
          render json: @user, status: :ok, object: @user and return
        else
          render text: "Please review your credentials", status: :unprocessable_entity and return
        end
      end

      private

        def user_params
          params.permit(:username, :password)
        end
    end
  end
end
