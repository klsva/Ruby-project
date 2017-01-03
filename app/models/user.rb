class User < ApplicationRecord
  before_save {self.email=email.downcase} #перевод в нижний регистр
  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i #константа
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false} #нечувствительность к регистру
  has_secure_password
  validates :password, length: {minimum: 6}
end
