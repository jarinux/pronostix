class ProviderSerializer < ActiveModel::Serializer
  attributes :id, :name, :credentials

  def id
    object.uuid
  end
end
