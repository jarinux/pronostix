class GroupSerializer < ActiveModel::Serializer

  attributes :id, :name, :description

  def id
    object.uuid
  end

end
