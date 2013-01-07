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
    return user.save
  end

  def User.authenticate email, password
    user = User.find_by_email(email)
    if user.password == password
      return user
    else
      return nil
    end
  end
end
