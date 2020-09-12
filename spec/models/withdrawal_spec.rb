require 'rails_helper'

RSpec.describe Withdrawal, type: :model do

  u = User.new
  withdrawal = Withdrawal.new

  describe 'validations' do
    it { is_expected.to validate_presence_of(:amount) }

    it "is not valid without a User" do
      withdrawal.amount = 3030
      withdrawal.user = nil
      expect(withdrawal).to_not be_valid
    end

    it "is not valid with a negative value like -1 " do
      withdrawal.amount = -1
      expect(withdrawal).to_not be_valid
    end

    it "is not valid with an Integer smaller than 10 like 9 " do
      withdrawal.amount = 9
      expect(withdrawal).to_not be_valid
    end

    it "is not valid with Float like 20.3" do
      withdrawal.amount = 20.3
      expect(withdrawal).to_not be_valid
    end

    it "is not valid with a nil amount" do
      withdrawal.amount = nil
      expect(withdrawal).to_not be_valid
    end

    it "is not valid with a String" do
      withdrawal.amount = "4kicks"
      expect(withdrawal).to_not be_valid
    end

    it "is not valid with a Hash" do
      withdrawal.amount = {}
      expect(withdrawal).to_not be_valid
    end

    it "is not valid with a Array" do
      withdrawal.amount = []
      expect(withdrawal).to_not be_valid
    end

    it "is not valid with a Boolean" do
      withdrawal.amount = true
      expect(withdrawal).to_not be_valid
    end

    it "is valid with an Integer like 10" do
      withdrawal.user = u
      withdrawal.amount = 10
      expect(withdrawal).to be_valid
    end

    it "is valid with an Integer like 2043" do
      withdrawal.user = u
      withdrawal.amount = 2043
      expect(withdrawal).to be_valid
    end

  end

end
