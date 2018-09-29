class UserSerializer < ActiveModel::Serializer

  attributes :id, :name, :email, :created_at, :city, :job, :preferred_sport, :preferred_team

  def id
    object.uuid
  end

end
