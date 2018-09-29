class Game < ApplicationRecord
  belongs_to :local_team, class: Team
  belongs_to :away_team, class: Team

  enum status: { coming: 0, ended: 1, canceled: 2 }

  validates_presence_of :local_team, :away_team, :status

end
