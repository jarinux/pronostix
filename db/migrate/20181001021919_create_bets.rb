class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.float :score
      t.integer :status, default: 0, index: true
      t.belongs_to :bet_type
      t.belongs_to :challenge_event
      t.belongs_to :bet_object, polymorphic: true
      t.timestamps
    end
  end
end
