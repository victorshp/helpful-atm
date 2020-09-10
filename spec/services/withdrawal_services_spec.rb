require 'rails_helper'

RSpec.describe WithdrawalService, type: :service do

  describe "Give the right banknotes where" do
    
    it "withdrawing -1 gives nil" do
      expect(WithdrawalService.new(-1).notes_amount).to eq(nil)
    end

    it "withdrawing 0 gives nil" do
      expect(WithdrawalService.new(0).notes_amount).to eq(nil)
    end

    it "withdrawing 1 gives nil" do
      expect(WithdrawalService.new(1).notes_amount).to eq(nil)
    end

    it "withdrawing 9 gives nil" do
      expect(WithdrawalService.new(9).notes_amount).to eq(nil)
    end

    it "withdrawing 10 gives {:A=>1}" do
      expect(WithdrawalService.new(10).notes_amount).to eq({:A=>1})
    end

    it "withdrawing 180 gives {:G=>1, :O=>1, :M=>1, :A=>1}" do
      expect(WithdrawalService.new(180).notes_amount).to eq({:G=>1, :O=>1, :M=>1, :A=>1})
    end

    it "withdrawing 9,000,050,021,321 gives {:G=>90000500213, :M=>1}" do
      expect(WithdrawalService.new(9000050021321).notes_amount).to eq({:G=>90000500213, :M=>1})
    end

  end

end
