class AddFieldsToEntries < ActiveRecord::Migration
  def self.up
    change_table :entries do |t|
      t.integer :user_id
      t.string :game_id
      t.string :round_id
    end
  end

  def self.down
    change_table :entries do |t|
      t.remove :user_id
      t.remove :game_id
      t.remove :round_id
    end
  end
end
