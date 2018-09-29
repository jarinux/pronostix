class AbstractProvider

  def initialize(provider: nil)
    raise StandardError.new('provider is missing') if provider.nil?
    @provider = provider
  end

  def get_league
    _throw_not_implemented_error
  end

  def get_team
    _throw_not_implemented_error
  end


  private

  def _throw_not_implemented_error
    raise StandardError.new('Method is not implemented')
  end
end