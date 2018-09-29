class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uuid, unique: true, index: true
      t.string :name
      t.string :slug, unique: true, index: true
      t.string :email
      t.string :password_digest
      t.text :biography
      t.string :city
      t.string :job
      t.string :preferred_sport
      t.string :preferred_team
      t.timestamps
    end
  end
end
