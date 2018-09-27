module Identifiable
  extend ActiveSupport::Concern

  included do
    before_create :set_uuid

    private

    def set_uuid
      self.uuid = SecureRandom.uuid
    end
  end

  module ClassMethods
  end

end

