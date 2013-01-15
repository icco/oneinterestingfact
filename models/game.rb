class Game < ActiveRecord::Base
  has_many :rounds

  def players
    return self.user_array.map do |user_id|
      User.find(user_id)
    end
  end

  def add_player user_id
    user_id = user_id.to_i
    if !user_id
      raise "Not a valid User ID."
    end

    self.user_array ||= []
    self.user_array.push(user_id)
    return self.save
  end

  def new_round topic, leader_id = nil
    round = Round.new
    round.topic = topic
    round.game = self
    if leader_id
      round.chooser = User.get(leader_id)
    else
      round.chooser = self.players.sample
    end
    round.save
  end
end
