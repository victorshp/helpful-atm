class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :withdrawals, dependent: :destroy

  acts_as_token_authenticatable

  after_create :welcome

  def welcome
    UserMailer.welcome(self).deliver_now
  end
end
 
