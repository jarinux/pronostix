class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uuid, unique: true, index: true
      t.string :name
      t.string :slug, unique: true, index: true
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end
  create_table :profiles do |t|
    t.belongs_to :user
    t.text :biography
    t.string :city
    t.string :job
    t.string :preferred_sport_id, index: true
    t.integer :preferred_team_id, index:true
    t.timestamps
  end
end
