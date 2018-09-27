# noinspection ALL
module V1
  class UsersController < ApplicationController

    def index
      authorize! :read, User

      @users = User.all
      json_response(@users)
    end

  end
end