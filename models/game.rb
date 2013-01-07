class Game < ActiveRecord::Base

  def players
    return self.user_array.map do |user_id|
      User.get(user_id)
    end
  end

  def add_player user_id
    self.user_array.push(user_id)
    return self.save
  end
end
