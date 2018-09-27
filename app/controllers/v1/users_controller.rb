module V1
  class UsersController < ApplicationController

    def index
      @users = User.all
      json_response(@users)
    end

  end
end