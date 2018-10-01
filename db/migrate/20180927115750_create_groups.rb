class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :uuid, unique: true, index: true
      t.string :name
      t.string :slug, unique: true, index: true
      t.text :description
      t.integer :visibility, default: 0, index: true
      t.timestamps
    end
  end
end
