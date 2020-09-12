require 'rails_helper'

RSpec.describe WithdrawalService, type: :service do

  describe "should give the right banknotes where" do
    it "withdrawing 10 gives {:A=>1}" do
      expect(WithdrawalService.new(10).notes_amount).to eq({:A=>1})
    end

    it "withdrawing 20 gives {:M=>1}" do
      expect(WithdrawalService.new(20).notes_amount).to eq({:M=>1})
    end

    it "withdrawing 50 gives {:O=>1}" do
      expect(WithdrawalService.new(50).notes_amount).to eq({:O=>1})
    end

    it "withdrawing 100 gives {:G=>1}" do
      expect(WithdrawalService.new(100).notes_amount).to eq({:G=>1})
    end    

    it "withdrawing 180 gives {:G=>1, :O=>1, :M=>1, :A=>1}" do
      expect(WithdrawalService.new(180).notes_amount).to eq({:G=>1, :O=>1, :M=>1, :A=>1})
    end

    it "withdrawing 9,000,050,021,321 gives {:G=>90000500213, :M=>1}" do
      expect(WithdrawalService.new(9000050021321).notes_amount).to eq({:G=>90000500213, :M=>1})
    end

    it "the Integer 72 works normally even without running any WithdrawalService's Class method." do
      expect(WithdrawalService.new(72).amount).to eq(72)
    end
  end

  # describe "should give the right banknotes where" do
  #   it "withdrawing -1 gives nil" do
  #     expect(WithdrawalService.new(-1).notes_amount).to eq(nil)
  #   end

  #   it "withdrawing 0 gives nil" do
  #     expect(WithdrawalService.new(0).notes_amount).to eq(nil)
  #   end

  #   it "withdrawing 1 gives nil" do
  #     expect(WithdrawalService.new(1).notes_amount).to eq(nil)
  #   end

  #   it "withdrawing 9 gives nil" do
  #     expect(WithdrawalService.new(9).notes_amount).to eq(nil)
  #   end
  # end
  
  # describe "should only allow integers to work" do
  #   it "and give 'nil' if a user inputs a Float" do
  #     expect(WithdrawalService.new(10.54).amount).to eq(nil)
  #   end

  #   it "and give 'nil' if a user inputs a String" do
  #     expect(WithdrawalService.new("abc").amount).to eq(nil)
  #   end

  #   it "and give 'nil' if a user inputs a Symbol" do
  #     expect(WithdrawalService.new(:peace).amount).to eq(nil)
  #   end

  #   it "and give 'nil' if a user inputs an Array" do
  #     expect(WithdrawalService.new([10, 2]).amount).to eq(nil)
  #   end

  #   it "and give 'nil' if a user inputs a Hash" do
  #     expect(WithdrawalService.new({}).amount).to eq(nil)
  #   end


  #   it "and give 'nil' if a user inputs a Boolean" do
  #     expect(WithdrawalService.new(true).amount).to eq(nil)
  #   end
  # end

end
