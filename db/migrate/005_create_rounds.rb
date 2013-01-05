class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.integer :winner
      t.integer :chooser
      t.text :topic
      t.timestamps
    end
  end

  def self.down
    drop_table :rounds
  end
end
