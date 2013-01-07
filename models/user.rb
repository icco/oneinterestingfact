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
