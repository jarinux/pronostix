class Team < ApplicationRecord
  include Identifiable

  include FriendlyId
  friendly_id :name, use: [:slugged]

  has_many :gateways, as: :syncable, dependent: :destroy
  has_many :league_participations
  has_many :league_editions, through: :league_participations

  validates :name, presence: true, uniqueness: true

end