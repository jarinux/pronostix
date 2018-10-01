class League < ApplicationRecord
  include Identifiable

  include FriendlyId
  friendly_id :name, :use => [:slugged]

  validates :name, presence: true, uniqueness: true

  has_many :teams
  has_many :gateways, :as => :syncable, :dependent => :destroy
  has_many :league_editions
end
