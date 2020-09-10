class WithdrawalService
attr_reader :amount

  def initialize(amount)
    @amount = amount.to_i
  end

  def notes_amount
    unless amount < 10
      {
      :G => (amount / 100),
      :O=> (amount % 100 / 50),
      :M => (amount % 100 % 50 / 20),
      :A => (amount % 100 % 50 % 20 / 10),
     }.reject {|_, v| v == 0}
    end
  end

  # FUN FACT! G-O-M-A represents the abbreviated names of the animals in Brazilian bills
    # Garoupa => 100
    # Onca-pintada => 50
    # Mico-leao-dourado => 20
    # Arara-vermelha => 10
end
