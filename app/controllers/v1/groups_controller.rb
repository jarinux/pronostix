module V1
  class GroupsController < ApplicationController

    def index
      authorize! :read, Group

      @groups = Group.all
      json_response(@groups)
    end
  end
end
