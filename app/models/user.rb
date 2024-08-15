class User < ApplicationRecord
  attr_accessor :password

  before_save :encrypt_password

  has_many :wallets, as: :entity

  def authenticate(plain_password)
    hashed_password(plain_password) == password_digest
  end

  private

  def encrypt_password
    self.password_digest = Digest::SHA256.hexdigest(password) if password.present?
  end

  def hashed_password(plain_password)
    Digest::SHA256.hexdigest(plain_password)
  end
end
