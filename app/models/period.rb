class Period < ApplicationRecord

  include Identifiable

  include FriendlyId
  friendly_id :name, :use => [:slugged]

  validates :name, presence: true, uniqueness: true
  validates_presence_of :start_date, :end_date

  has_many :league_participations
end
