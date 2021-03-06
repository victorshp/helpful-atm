require 'spec_helper'

RSpec.describe WithdrawalService, type: :service do

  describe "should give the right banknotes where" do
    before(:each) do
      def withdrawal(amount)
        WithdrawalService.new(amount).notes_amount
      end
    end

    it "withdrawing 10 gives {:A=>1}" do
      expect(withdrawal(10)).to eq({:A=>1})
    end

    it "withdrawing 20 gives {:M=>1}" do
      expect(withdrawal(20)).to eq({:M=>1})
    end

    it "withdrawing 50 gives {:O=>1}" do
      expect(withdrawal(50)).to eq({:O=>1})
    end

    it "withdrawing 100 gives {:G=>1}" do
      expect(withdrawal(100)).to eq({:G=>1})
    end    

    it "withdrawing 180 gives {:G=>1, :O=>1, :M=>1, :A=>1}" do
      expect(withdrawal(180)).to eq({:G=>1, :O=>1, :M=>1, :A=>1})
    end

    it "withdrawing 9,000,050,021,321 gives {:G=>90000500213, :M=>1}" do
      expect(withdrawal(9000050021321)).to eq({:G=>90000500213, :M=>1})
    end

    it "the Integer 72 works normally even without running any WithdrawalService's Class method." do
      expect(WithdrawalService.new(72).amount).to eq(72)
    end
  end
end
