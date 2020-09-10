class CreateWithdrawals < ActiveRecord::Migration[6.0]
  def change
    create_table :withdrawals do |t|
      t.bigint :amount
      t.string :banknotes

      t.timestamps
    end
  end
end
