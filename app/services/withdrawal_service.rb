class WithdrawalService
attr_reader :amount

  def initialize(amount)
    # Class methods will give relevant output when employed if user instanciates it with an Integer argument.
    @amount = amount.class == Integer ? amount.to_i : nil
  end

  def notes_amount
    # Employ bank notes logic only if @amount => 10 and is an Integer
    unless amount < 10
      # Return a Hash that gives the amount of each respective bill (bank note) the user shall withdraw
      {
      :G => (amount / 100),
      :O=> (amount % 100 / 50),
      :M => (amount % 100 % 50 / 20),
      :A => (amount % 100 % 50 % 20 / 10),
     }.reject {|_, v| v == 0}
    end
  end

  private

  def save_record(event)
    if event.valid? && event.save
      @successful = true
      @record = find_event(event.id)
    else
      @successful = false
      @errors = event.errors.full_messages
    end
  end

  # FUN FACT! G-O-M-A represents the abbreviated names of the animals in Brazilian bills
    # Garoupa => 100
    # Onca-pintada => 50
    # Mico-leao-dourado => 20
    # Arara-vermelha => 10
end
