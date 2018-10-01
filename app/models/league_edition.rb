class LeagueEdition < ApplicationRecord
  include Identifiable

  include FriendlyId
  friendly_id :name, :use => [:slugged]

  belongs_to :league
  has_many :league_participations
  has_many :teams, through: :league_participations
  has_many :games

  delegate :name, :sport, to: :league, prefix: true, allow_nil: true

  validates_presence_of :name

end
