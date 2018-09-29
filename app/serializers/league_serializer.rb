class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name, :sport

  def id
    object.uuid
  end
end
