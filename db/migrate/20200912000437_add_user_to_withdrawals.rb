class AddUserToWithdrawals < ActiveRecord::Migration[6.0]
  def change
    add_reference :withdrawals, :user, null: false, foreign_key: true
  end
end
