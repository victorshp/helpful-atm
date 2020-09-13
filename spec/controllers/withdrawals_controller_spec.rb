require 'pry'
require 'spec_helper'

RSpec.describe "WithdrawalsController", type: :request  do
  before(:each) do
    def user_create
      @u = User.new(email: Faker::Internet.email, password: "password", authentication_token: Faker::String.random(length: 20)) 
      @u.save
    end
    
    def withdrawal_create
      @w = Withdrawal.new(amount: Faker::Number.between(from: 10, to: 9000000000000000000))
      @w.banknotes = WithdrawalService.new(@w.amount).notes_amount
      user_create
      @w.user = @u
      @w.save
    end
  end

  describe 'GET #index' do

    it "renders an array of the user's withdrawal instances if they have at least one record in the database and the right params are given" do
      withdrawal_create
      get '/api/v1/withdrawals', headers: { "Content-Type" => "application/json", "X-User-Email" => @u.email, "X-User-Token" => @u.authentication_token }
      json = JSON.parse(response.body)
      # json[0] will be the only instance of the DB created by Withdrawal, as the db is cleaned. We're just passing it back to become a Withdrawal instance.
      expect(Withdrawal.new(json[0])).to eq(Withdrawal.first)
    end

    it "returns an empty array if the user inputs the wrong params" do
      withdrawal_create
      # Different from the above test, this one had the user's API token missing.
      get '/api/v1/withdrawals', headers: { "Content-Type" => "application/json", "X-User-Email" => @u.email, "X-User-Token" => '' }
      json = JSON.parse(response.body)
      expect(Withdrawal.new(json[0])).not_to eq(Withdrawal.first)
    end

    it "returns an empty array if the user has no records in the database" do
      user_create
      get '/api/v1/withdrawals', headers: { "Content-Type" => "application/json", "X-User-Email" => @u.email, "X-User-Token" => @u.authentication_token }
      json = JSON.parse(response.body)
      expect(Withdrawal.new(json[0])).not_to eq(Withdrawal.first)
    end
  end

  describe 'GET #show' do
    it "renders the withdrawal instance if the user that requested that show has created it" do
      withdrawal_create
      get "/api/v1/withdrawals/#{@w.id}", headers: { "Content-Type" => "application/json", "X-User-Email" => @u.email, "X-User-Token" => @u.authentication_token }
      json = JSON.parse(response.body)
      expect(Withdrawal.new(json)).to be_instance_of(Withdrawal)
    end

    it "does not render the withdrawal instance if the user that requested that show hasn't created it" do
      @u1 = User.new(email: Faker::Internet.email, password: "password", authentication_token: Faker::String.random(length: 20))
      @u1.save
      withdrawal_create
      get "/api/v1/withdrawals/#{@w.id}", headers: { "Content-Type" => "application/json", "X-User-Email" => @u1.email, "X-User-Token" => @u1.authentication_token }
      json = JSON.parse(response.body)
      expect(response[:withdrawal]).to eq(nil)
    end
  end

  describe 'POST #create' do
    it "does post with valid params" do
      user_create
      withdrawal_params = Withdrawal.new(amount: 180, user_id: @u.id)
      
      post '/api/v1/withdrawals', params: withdrawal_params.to_json , headers: { "Content-Type" => "application/json", "X-User-Email" => @u.email, "X-User-Token" => @u.authentication_token  }
      expect(response).to have_http_status(:created)
    end

    it "doesn't post with invalid params" do  
      user_create
      withdrawal_params = Withdrawal.new(amount: 180, user_id: '')

      post '/api/v1/withdrawals', params: withdrawal_params.to_json, headers: { "Content-Type" => "application/json", "X-User-Email" => '', "X-User-Token" => @u.authentication_token }
      expect(response).to have_http_status(:unauthorized)    
    end
  end

end
