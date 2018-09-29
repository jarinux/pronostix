class AbstractStrategy

  def execute
    _throw_not_implemented_error
  end

  private

  def _throw_not_implemented_error
    raise StandardError.new('Method is not implemented')
  end

  def _get_gateways(model: nil)
    Gateway.where(syncable_type: model, provider: @provider, status: :active)
  end

end