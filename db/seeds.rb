
roles = [:user, :superadmin]

roles.each do |role|
  Role.create(name: role)
end

users = {}
if Rails.env == 'development'
  roles.each do |role|
    users[role] = User.create(name: role, email: "#{role}@jarinux.net", password: role, password_confirmation: role)
    users[role].add_role(role)
  end
end

pronofootRoles = [:player, :moderator, :admin]
pronofoot = Group.create(name: 'pronofoot', description: 'Communauté Pronofoot')
pronofootRoles.each do |role|
  Role.create(name: role, resource: pronofoot)
  users[role] = User.create(name: role, email: "#{role}@jarinux.net", password: role, password_confirmation: role)
  users[role].add_role(role, pronofoot)
end

# Providers
footballApiProvider = Provider.create!(name: 'Football Api', credentials: { host: 'http://api.football-api.com', token: '565ec012251f932ea4000001fa542ae9d994470e73fdb314a8a56d76' })

period = Period.create(name: '2018/2019', start_date: '2018-08-01', end_date: '2019-05-30')

# Leagues
ligue1 = League.create(name: 'Ligue 1', sport: 'soccer', country_code: 'fr')
Gateway.create(syncable: ligue1, provider: footballApiProvider, gateway_id: '1221')