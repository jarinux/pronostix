namespace :strategies do
  namespace :soccer do
    namespace :leagues do
      task :sync => :environment do
        @soccer_service = SoccerService.new
        @leagues = League.where(sport: 'soccer')
        @leagues.each do |league|
          @soccer_service.update_league(league)
          @soccer_service.set_teams_from_league(league)
          @soccer_service.set_games_from_league(league)
        end
      end
    end
    namespace :teams do
      task :sync => :environment do
        @soccer_service = SoccerService.new
        @teams = Team.where(sport: 'soccer')
        @teams.each do |team|
          @soccer_service.update_team(team)
        end
      end
    end
  end
end
