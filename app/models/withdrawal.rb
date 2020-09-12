class Withdrawal < ApplicationRecord
  belongs_to :user

  validates :amount, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 9 }
end
