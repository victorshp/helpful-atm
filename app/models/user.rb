class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :withdrawals, dependent: :destroy

  acts_as_token_authenticatable
end
 
