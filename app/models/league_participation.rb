class LeagueParticipation < ApplicationRecord
  belongs_to :period
  belongs_to :league
  belongs_to :team
end
