class Gateway < ApplicationRecord

  belongs_to :provider
  belongs_to :syncable, polymorphic: true

  validates :provider, presence: true
  validates :syncable, presence: true
  validates :gateway_id, presence: true

  enum status: { inactive: 0, active: 1 }

end
