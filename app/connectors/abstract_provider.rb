class AbstractProvider

  def initialize(provider: nil)
    raise StandardError.new('provider is missing') if provider.nil?
    @provider = provider
  end

end