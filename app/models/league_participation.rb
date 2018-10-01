class LeagueParticipation < ApplicationRecord
  belongs_to :league_edition
  belongs_to :team
end
