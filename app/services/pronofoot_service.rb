class PronofootService

  def import(period: nil)
    raise StandardError.new('period is missing') if period.nil?

    @period = period
    @group = Group.find_by(name: 'Pronofoot')
    @league = League.find_by(name: 'Ligue 1')
    @league_edition = LeagueEdition.where(league: @league, name: period).first_or_create

    _set_championship
    _set_cup
    _associate_challenges_to_group
    _generate_bets
  end

  private

  def _set_championship
    @championship = Challenge.where(name: "Championnat #{@period}").first_or_create(description: "Championnat Pronofoot pour la saison #{@period}")
  end

  def _set_cup
    @cup = Challenge.where(name: "Coupe #{@period}").first_or_create(description: "Coupe Pronofoot pour la saison #{@period}")
  end

  def _associate_challenges_to_group
    @championship.groups << @group unless @championship.groups.include?(@group)
    @cup.groups << @group unless @cup.groups.include?(@group)
  end

  def _generate_bets
    bet_type = BetType.first
    @league_edition.games.group_by(&:round).each do |round, games|
      games.each do |game|
        event = @championship.challenge_events.where(name: round).first_or_create
        event.bets.where(bet_object: game, bet_type: bet_type).first_or_create(score: 2)
      end
    end
  end
end