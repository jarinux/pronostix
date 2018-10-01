class FootballApiConnector < AbstractProvider

  def get_competition(id, params = {})
    JSON.parse(HTTParty.get("#{_get_base_url}/competitions/#{id}?#{parsed_params(params)}").body)
  end

  def get_standings(comp_id, params = {})
    JSON.parse(HTTParty.get("#{_get_base_url}/standings/#{comp_id}?#{parsed_params(params)}").body)
  end

  def get_matches(params = {})
    JSON.parse(HTTParty.get("#{_get_base_url}/matches?#{parsed_params(params)}").body)
  end

  def get_team(id)
    JSON.parse(HTTParty.get("#{_get_base_url}/team/#{id}?#{parsed_params}").body)
  end

  private

  def _get_base_url
    "#{@provider['credentials']['host']}/2.0"
  end

  def parsed_params(params = {})
    params.merge({ Authorization: @provider['credentials']['token'] }).map{ |key, value| "#{key}=#{value}" }.join('&')
  end

end