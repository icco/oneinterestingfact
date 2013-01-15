class User < ActiveRecord::Base

  # https://github.com/codahale/bcrypt-ruby/
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def User.create email, password
    user = User.new
    user.email = email
    user.password = password
    user.save

    return user
  end

  def generate_password size = 12
    @@charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z a c d e f g h j k m n p q r t v w x y z}
    pw = (0...size).map{ @@charset.to_a[rand(@@charset.size)] }.join
    self.password = pw
    return true
  end

  def User.authenticate email, password
    if !email or !password
      return nil
    end

    user = User.find_by_email(email)
    if user
      if user.password == password
        return user
      else
        return nil
      end
    else
      return User.create email, password
    end
  end
end
