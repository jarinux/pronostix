
roles = [:user, :superadmin]

roles.each do |role|
  Role.create(name: role)
end

users = {}
if Rails.env == 'development'
  roles.each do |role|
    users[role] = User.create(name: role, email: "#{role}@jarinux.net", password: role, password_confirmation: role, uuid: SecureRandom.uuid)
    users[role].add_role(role)
  end
end

pronofootRoles = [:player, :moderator, :admin]
pronofoot = Group.create(uuid: SecureRandom.uuid, name: 'pronofoot', slug: 'pronofoot', description: 'Communauté Pronofoot')
pronofootRoles.each do |role|
  Role.create(name: role, resource: pronofoot)
  users[role] = User.create(name: role, email: "#{role}@jarinux.net", password: role, password_confirmation: role, uuid: SecureRandom.uuid)
  users[role].add_role(role, pronofoot)
end
