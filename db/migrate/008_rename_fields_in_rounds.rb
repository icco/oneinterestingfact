class RenameFieldsInRounds < ActiveRecord::Migration
  def change
    change_table :rounds do |t|
      t.rename :chooser, :chooser_id
      t.rename :winner, :winner_id
    end
  end
end
