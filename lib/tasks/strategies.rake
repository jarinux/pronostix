namespace :strategies do
  namespace :football_api do
    desc 'Execute strategy'
    task :execute => :environment do
      FootballApiStrategy.new.execute
    end
  end
end
