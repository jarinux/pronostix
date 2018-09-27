# noinspection ALL
module V1
  class UsersController < ApplicationController

    def index
      authorize! :read, User

      @users = User.all
      json_response(@users)
    end

    def profile
      authorize! :read, @current_user

      json_response(UserProfileSerializer.new(@current_user))
    end

  end
end