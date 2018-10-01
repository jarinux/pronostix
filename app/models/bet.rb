class Bet < ApplicationRecord

  belongs_to :bet_type
  belongs_to :bet_object, polymorphic: true
  belongs_to :challenge_event

  validates :bet_object, presence: true

  enum status: { open: 0, close: 1, inactive: 2 }

end
