class Group < ApplicationRecord
  include Sluggable
  include Identifiable

  validates :uuid, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

end
