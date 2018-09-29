class UserProfileSerializer < ActiveModel::Serializer

  attributes :id, :name, :email, :created_at, :city, :job, :preferred_sport, :preferred_team, :groups

  def id
    SecureRandom.uuid
  end

end
