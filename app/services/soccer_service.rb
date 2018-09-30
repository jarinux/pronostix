class SoccerService < AbstractService

  def initialize
    @provider = Provider.where(name: 'Football Api').first
    @connector = FootballApiConnector.new(provider: @provider)
  end

  def update_league(league)
    gateway = _get_gateways(league).first
    raise StandardError.new("Gateway is missing for league #{league.id}") if gateway.nil?
    data = @connector.get_competition(gateway.gateway_id)
    payload = { name: data['name'], country_code:  ISO3166::Country.find_country_by_name(data['region']).alpha2.downcase, sport: 'soccer' }
    league.update(payload)
  end

  def set_teams_from_league(league)
    gateway = _get_gateways(league).first
    standings = @connector.get_standings(gateway.gateway_id)
    standings.each do |standing|
      period = Period.where(name: standing['season']).first_or_create
      team = Team.where(name: standing['team_name'], sport: 'soccer').first_or_create
      Gateway.where(syncable: team, gateway_id: standing['team_id'], provider: @provider).first_or_create
      LeagueParticipation.where(team_id: team.id, league_id: league.id, period_id: period.id).first_or_create
    end
  end

  def set_games_from_league(league, from_date: '2018-08-10', to_date: '2019-07-01')
    league_gateway = _get_gateways(league).first
    date_format = '%Y-%m-%d'
    days = (Date.strptime(from_date,date_format)..Date.strptime(to_date,date_format)).to_a
    days.each do |day|
      DebugLogger.info day
      data = @connector.get_matches({ comp_id: league_gateway.gateway_id, match_date: day})
      if data.kind_of?(Array)
        data.each do |game_data|
          local_team = Gateway.where(syncable_type: 'Team', provider: @provider, gateway_id: game_data['localteam_id']).first.try(:syncable)
          away_team = Gateway.where(syncable_type: 'Team', provider: @provider, gateway_id: game_data['visitorteam_id']).first.try(:syncable)
          game = Game.where(league: league, local_team: local_team, away_team: away_team, round: game_data['week']).first_or_create
          game.gateways.where(provider: @provider, gateway_id: game_data['id']).first_or_create
          payload = { event_date: Date.strptime(game_data['formatted_date'], '%d.%m.%Y') }
          game.update(payload)
        end
      end
    end
  end

  def update_team(team)
    team_gateway = _get_gateways(team).first
    data = @connector.get_team(team_gateway.gateway_id)
    payload = { name: data['name'], country_code: ISO3166::Country.find_country_by_name(data['country']).alpha2.downcase, founded: Date::strptime(data['founded'], '%Y'), coach_name: data['coach_name'] }
    team.update(payload)
  end



end