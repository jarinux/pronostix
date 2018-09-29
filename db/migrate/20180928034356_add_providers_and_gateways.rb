class AddProvidersAndGateways < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :uuid, unique: true, index: true
      t.string :name
      t.json :credentials
      t.timestamps
    end
    create_table :gateways do |t|
      t.string :gateway_id
      t.belongs_to :provider, index: true
      t.belongs_to :syncable, polymorphic: true
      t.integer :status, default: 1
      t.timestamps
    end
    add_index :gateways, [:syncable_id, :syncable_type]
  end
end

