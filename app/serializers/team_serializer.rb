class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :founded, :coach_name
end
