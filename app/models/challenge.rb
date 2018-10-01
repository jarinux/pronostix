class Challenge < ApplicationRecord
  include Identifiable

  include FriendlyId
  friendly_id :name, :use => [:slugged]

  has_and_belongs_to_many :groups
  has_many :challenge_events

  enum status: { coming: 0, on_going: 1, ended: 2 }
  enum visibility: { close: 0, open: 1}

  validates_presence_of :name

end
