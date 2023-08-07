module Api
  module V1
    class AuthenticationsController < ApplicationController
      def create
        render json: { message: "User successfully logged in!", user: current_user } if current_user
      end
    end
  end
end

