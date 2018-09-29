class FootballApiConnector < AbstractProvider

  def get_league(id: nil)
    body = JSON.parse(HTTParty.get("#{_get_base_url}/competitions/#{id}?#{parsed_params}").body)
    { gateway_id: body['id'], data: { name: body['name'], country_code:  ISO3166::Country.find_country_by_name(body['region']).alpha2.downcase, sport: 'soccer' } }
  end

  def get_team(id: nil, period_id: nil)
    body = JSON.parse(HTTParty.get("#{_get_base_url}/team/#{id}?#{parsed_params}").body)
    { gateway_id: body['team_id'], data: { name: body['name'], country_code: ISO3166::Country.find_country_by_name(body['country']).alpha2.downcase, founded: Date::strptime(body['founded'], '%Y'), coach_name: body['coach_name'] } }
  end

  def get_teams_from_league(league_id: nil)
    data = JSON.parse(HTTParty.get("#{_get_base_url}/standings/#{league_id}?#{parsed_params}").body)
    teams = []
    data.each do |t|
      period = Period.where(name: t['season']).first_or_create
      teams << { team_id: t['team_id'], period_id: period.id }
    end
    teams
  end

  def get_games(league_id: nil, from_date: nil, to_date: nil)
    params = {
        comp_id: league_id,
    }
    params[:from_date] = from_date if from_date
    params[:to_date] = to_date if to_date
    JSON.parse(HTTParty.get("#{_get_base_url}/matches?#{parsed_params(params)}").body)
  end

  private

  def _get_base_url
    "#{@provider['credentials']['host']}/2.0"
  end

  def parsed_params(params = {})
    params.merge({ Authorization: @provider['credentials']['token'] }).map{ |key, value| "#{key}=#{value}" }.join('&')
  end

end