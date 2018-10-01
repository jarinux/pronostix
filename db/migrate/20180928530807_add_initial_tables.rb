class AddInitialTables < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.string :uuid, unique: true, index: true
      t.string :name
      t.string :slug, unique: true, index: true
      t.string :sport, index: true
      t.string :country_code, index: true
      t.timestamps
    end
    create_table :league_editions do |t|
      t.string :uuid, unique: true, index: true
      t.string :name
      t.string :slug, unique: true, index: true
      t.belongs_to :league
    end
    create_table :teams do |t|
      t.string :uuid, unique: true, index: true
      t.string :name
      t.string :slug, unique: true, index: true
      t.string :sport, index: true
      t.date :founded
      t.string :country_code, index: true
      t.string :coach_name
      t.timestamps
    end
    create_table :league_participations do |t|
      t.belongs_to :league_edition
      t.belongs_to :team
    end
    create_table :challenges do |t|
      t.string :uuid, unique: true, index: true
      t.string :name
      t.string :slug, unique: true, index: true
      t.text :description
      t.integer :visibility, default: 0, index: true
      t.timestamps
    end
    create_table :challenges_groups do |t|
      t.belongs_to :group
      t.belongs_to :challenge
    end
    create_table :challenge_events do |t|
      t.string :uuid, unique: true, index: true
      t.string :name
      t.integer :status, index: true
      t.datetime :start_date, index: true
      t.datetime :end_date
      t.belongs_to :challenge
      t.timestamps
    end
    create_table :challenge_periods do |t|
      t.belongs_to :competition, index: true
      t.belongs_to :period, index: true
    end
  end
end