class Group < ApplicationRecord
  include Identifiable

  include FriendlyId
  friendly_id :name, :use => [:slugged]

  validates :uuid, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

end
