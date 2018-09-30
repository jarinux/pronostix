class Game < ApplicationRecord
  belongs_to :league
  belongs_to :local_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  has_many :gateways, as: :syncable, dependent: :destroy

  enum status: { coming: 0, ended: 1, canceled: 2 }

  validates_presence_of :local_team, :away_team, :status

end
