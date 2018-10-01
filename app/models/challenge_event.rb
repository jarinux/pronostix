class ChallengeEvent < ApplicationRecord
  include Identifiable

  belongs_to :challenge
  has_many :bets

  enum status: { inactive: 0, open: 1, close: 2 }

  validates_presence_of :name

end
