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
    create_table :teams do |t|
      t.string :uuid, unique: true, index: true
      t.string :name
      t.string :slug, unique: true, index: true
      t.date :founded
      t.string :country_code, index: true
      t.string :coach_name
      t.timestamps
    end
    create_table :periods do |t|
      t.string :uuid, unique: true, index: true
      t.string :name
      t.string :slug, unique: true, index: true
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
    create_table :league_participations do |t|
      t.belongs_to :league
      t.belongs_to :team
      t.belongs_to :period
    end
    create_table :competitions do |t|
      t.string :uuid, unique: true, index: true
      t.string :name
      t.string :slug, unique: true, index: true
      t.text :description
      t.timestamps
    end
    create_table :competition_periods do |t|
      t.belongs_to :competition, index: true
      t.belongs_to :period, index: true
    end
  end
end