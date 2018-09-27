class UserProfileSerializer < ActiveModel::Serializer

  attributes :uuid, :name, :email, :created_at, :city, :job, :preferred_sport, :preferred_team, :groups

end
