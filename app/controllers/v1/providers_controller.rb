class V1::ProvidersController < ApplicationController

  def index
    authorize! :read, Provider

    @providers = Provider.all
    json_response(@providers)
  end


end
