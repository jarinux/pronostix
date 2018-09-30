class AbstractService

  private

  def _get_gateways(model)
    Gateway.where(syncable: model, provider: @provider, status: :active)
  end

end