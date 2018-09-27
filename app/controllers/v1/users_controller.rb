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

    def by_group
      @group = Group.where(uuid: params[:group_id]).first
      authorize! :read, @group

      @users = Role.where(name: :player, group: @group).users

      json_response(@users)
    end

  end
end