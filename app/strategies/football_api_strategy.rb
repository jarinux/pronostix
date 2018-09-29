class FootballApiStrategy < AbstractStrategy

  def initialize
    @provider = Provider.where(name: 'Football Api').first
    @connector = FootballApiConnector.new(provider: @provider)
  end

  def execute
    # Sync league
    @league_gateways = _get_gateways(model: 'League')
    @league_gateways.each do |league|
      update_league(league)
      set_teams_from_league(league)
      set_games_from_league(gateway_league: league)
    end
  end

  def update_league(gateway)
    payload = @connector.get_league(id: gateway.gateway_id)
    gateway.syncable.update(payload[:data])
  end

  def set_teams_from_league(gateway_league)
    @connector.get_teams_from_league(league_id: gateway_league.gateway_id).each do |team|
      gateway_team = _set_team(@connector.get_team(id: team[:team_id]))
      _set_league_participation(league_id: gateway_league.syncable_id, team_id: gateway_team.syncable_id, period_id: team[:period_id] ) if team[:period_id]
    end
  end

  def set_games_from_league(gateway_league: nil, from_date: '2018-09-01', to_date: '2018-09-20')
    @connector.get_games(league_id: gateway_league.gateway_id, from_date: from_date, to_date: to_date).each do |game|
      DebugLogger.info game
    end
  end

  private

  def _set_team(payload)
    team = Team.where(name: payload[:data][:name]).first_or_create
    team.update(payload[:data])
    Gateway.where(syncable: team, gateway_id: payload[:gateway_id], provider: @provider).first_or_create
  end

  def _set_league_participation(league_id: nil, team_id: nil, period_id: nil)
    LeagueParticipation.where(league_id: league_id, team_id: team_id, period_id: period_id).first_or_create
  end
end