class User < ApplicationRecord
  attr_accessor :remember_token #создает методы доступа к атрибуту(getter и setter)
  before_save {self.email=email.downcase} #перевод в нижний регистр
  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i #константа
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false} #нечувствительность к регистру
  has_secure_password
  validates :password, length: {minimum: 6}

  #возвращает дайджест для указанной строки / в тч для тестов
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ?
        BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #возвращает случайный токен
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #запоминает пользователя в базе данных для использования в пост сеансах
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  #возвращает true, если указанный токен соответсвует дайджесту
  def authenticated?(remember_token)
    return false if remember_digest.nil? #обработка несуществующего дайджеста
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  #забывает пользователя
  def forget
    update_attribute(:remember_digest, nil)
  end
end
