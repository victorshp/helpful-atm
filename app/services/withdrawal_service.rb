class WithdrawalService
attr_reader :amount

  def initialize(amount)
    # Class methods will give relevant output when employed if user instanciates it with an Integer argument.
    @amount = amount
  end

  def notes_amount
    # Employ bank notes logic only if @amount => 10 and is an Integer
      # Return a Hash that gives the amount of each respective bill (bank note) the user shall withdraw
      {
      :G => (amount / 100),
      :O=> (amount % 100 / 50),
      :M => (amount % 100 % 50 / 20),
      :A => (amount % 100 % 50 % 20 / 10),
     }.reject {|_, v| v == 0}
  end

  # FUN FACT! G-O-M-A represents the abbreviated names of the animals in Brazilian bills
    # Garoupa => 100
    # Onca-pintada => 50
    # Mico-leao-dourado => 20
    # Arara-vermelha => 10
end
