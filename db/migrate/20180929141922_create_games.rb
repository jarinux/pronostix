class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.belongs_to :league
      t.integer :local_team_id, index: true
      t.integer :away_team_id, index: true
      t.integer :local_score
      t.integer :away_score
      t.integer :status, index: true, default: 0
      t.datetime :event_date
      t.integer :round
      t.timestamps
    end
  end
end
