class Group < ApplicationRecord
  include Identifiable

  include FriendlyId
  friendly_id :name, :use => [:slugged]

  validates :uuid, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  has_and_belongs_to_many :challenges

  enum visibility: { close: 0, open: 1}

end
