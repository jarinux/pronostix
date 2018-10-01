class User < ApplicationRecord
  include Identifiable

  include FriendlyId
  friendly_id :name, :use => [:slugged]

  rolify

  after_create :assign_default_role

  has_secure_password

  has_one :profile

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

end
