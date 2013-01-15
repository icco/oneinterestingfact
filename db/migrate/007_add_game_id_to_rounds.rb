class AddGameIdToRounds < ActiveRecord::Migration
  def self.up
    change_table :rounds do |t|
      t.integer :game_id
    end
  end

  def self.down
    change_table :rounds do |t|
      t.remove :game_id
    end
  end
end
