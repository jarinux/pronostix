class Provider < ApplicationRecord
  include Identifiable

  validates :name, presence: true, uniqueness: true


end
