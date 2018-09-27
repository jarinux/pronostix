class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :uuid
      t.string :name
      t.string :slug
      t.text :description
      t.timestamps
    end
  end
end
