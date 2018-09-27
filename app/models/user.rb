class User < ApplicationRecord
  rolify
  before_create :set_uuid
  after_create :assign_default_role

  has_secure_password

  validates :uuid, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def groups
    roles.map{|r| r.resource.try(:name) }.compact
  end

  private

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end

  def set_uuid
    uuid = SecureRandom.uuid
  end
end
