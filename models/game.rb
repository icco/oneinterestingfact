class Game < ActiveRecord::Base
  has_many :rounds

  has_one :chooser, :class_name => "User"
  has_one :winner, :class_name => "User"

  def players
    return self.user_array.map do |user_id|
      User.find(user_id)
    end
  end

  def add_player user_id
    self.user_array ||= []
    self.user_array.push(user_id)
    return self.save
  end

  def new_round topic, leader_id = nil
    round = Round.new
    round.topic = topic
    round.game = self
    if leader_id
      round.chooser = leader_id
    else
      round.chooser = self.players.sample.id
    end
    round.save
  end
end
