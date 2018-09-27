class Group < ApplicationRecord
  before_create :set_uuid

  validates :uuid, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  private

  def set_uuid
    uuid = SecureRandom.uuid
  end
end
