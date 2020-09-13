require 'pry'
require 'spec_helper'

RSpec.describe "WithdrawalsController", type: :request  do

  describe 'GET #index' do

    it "returns an array of withdrawal instances" do
      u = User.new(email: Faker::Internet.email, password: "password", authentication_token: Faker::String.random(length: 20))
      u.save
      
      w = Withdrawal.new(amount: Faker::Number.between(from: 10, to: 9000000000000000000))
      w.banknotes = WithdrawalService.new(w.amount).notes_amount
      w.user = u
      w.save

      get '/api/v1/withdrawals', headers: { "Content-Type" => "application/json", "X-User-Email" => u.email, "X-User-Token" => u.authentication_token }
      json = JSON.parse(response.body)
      binding.pry
      expect(json).to render_template(:index)
    end

  end

  describe 'GET #show' do    
  end

  describe 'POST #create' do    
  end

end
