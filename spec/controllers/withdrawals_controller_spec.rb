RSpec.describe "WithdrawalsController", type: 'request' do
  describe "should perform GET" do

      it "and render correctly with the right params" do
        u = User.new(email: Faker::Internet.email, password: "password", authentication_token: Faker::String.random(length: 20))
        u.save
        w = Withdrawal.new(amount: Faker::Number.between(from: 10, to: 9000000000000000000))
        w.banknotes = WithdrawalService.new(w.amount).notes_amount
        w.user = u
        expect(w.save).to eq(true)
      end

      it "and not render correctly under the wrong params" do
        w = Withdrawal.new(amount: Faker::Number.between(from: 10, to: 9000000000000000000))
        w.banknotes = WithdrawalService.new(w.amount).notes_amount
        expect(w.save).to eq(false)
      end

  end

  describe "should perform POST" do

    it "and render correctly with the right params" do
      u = User.new(email: Faker::Internet.email, password: "password", authentication_token: Faker::String.random(length: 20))
      u.save
      w = Withdrawal.new(amount: Faker::Number.between(from: 10, to: 9000000000000000000))
      w.banknotes = WithdrawalService.new(w.amount).notes_amount
      w.user = u
      expect(w.save).to eq(true)
    end

    it "and not render correctly under the wrong params" do
      w = Withdrawal.new(amount: Faker::Number.between(from: 10, to: 9000000000000000000))
      w.banknotes = WithdrawalService.new(w.amount).notes_amount
      expect(w.save).to eq(false)
    end

  end
end
