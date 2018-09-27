roles = [:user, :player, :moderator, :admin]

roles.each do |role|
  Role.create(name: role)
end

if Rails.env == 'development'
  roles.each do |role|
    user = User.create(name: role, email: "#{role}@jarinux.net", password: role, password_confirmation: role, uuid: SecureRandom.uuid)
    user.add_role(role)
  end
end