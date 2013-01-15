class Round < ActiveRecord::Base
  belongs_to :game

  has_one :chooser, :class_name => "User"
  has_one :winner, :class_name => "User"

end
