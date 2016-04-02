require 'bcrypt'

class User < ActiveRecord::Base
  has_many :games, class_name: 'Game', foreign_key: :creator_id
  has_many :questions, through: :games

  def password
    @password ||= BCrypt::Password.new(self.encrypted_password)
  end

  def password=(password_input)
    @password = BCrypt::Password.create(password_input)
    self.encrypted_password = @password
  end

  def self.authenticate(username, password_input)
    user = User.find_by(username: username)
    if user && user.password == password_input
      return user
    else
      return nil
    end
  end
end
