module Identifiable
  extend ActiveSupport::Concern

  included do
    before_validation :set_uuid, on: :create

    validates :uuid, presence: true, uniqueness: true

    private

    def set_uuid
      return if self.uuid.present?
      self.uuid = SecureRandom.uuid
    end
  end

  module ClassMethods
  end

end

