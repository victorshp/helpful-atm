require 'rails_helper'

RSpec.describe Api::V1::WithdrawalsController, type: :controller do

  describe 'before actions' do
    describe 'load_withdrawal' do
      it 'is expected to define before action' do
        is_expected.to use_before_action(:load_withdrawal)
      end
    end
  end

  # index action
  describe 'GET #index' do
    before do
      get :index
    end

    it 'is expected to assign user instance variable' do
      expect(assigns[:users]).to eq(User.all)
    end
  end

  # show action
  describe 'GET #show' do
    before do
      get :new
    end

    it 'is expected to assign user as new instance variable' do
      expect(assigns[:user]).to be_instance_of(User)
    end

    it 'renders new template' do
      is_expected.to render_template(:new)
    end

    it 'renders application layout' do
      is_expected.to render_template(:application)
    end
  end

  # create action
  describe 'POST #create' do
    before do
      post :create, params: params
    end

    context 'when params are correct' do
      let(:params) { { user: { name: "Abhishek kanojia" } } }

      it 'is expected to create new user successfully' do
        expect(assigns[:user]).to be_instance_of(User)
      end

      it 'is expected to have name assigned to it' do
        expect(assigns[:user].name).to eq('Abhishek kanojia')
      end

      it 'is expected to redirect to users path' do
        is_expected.to redirect_to users_path
      end

      it 'is expected to set flash message' do
        expect(flash[:notice]).to eq('User Created Successfully.')
      end
    end

    context 'when params are not correct' do
      let(:params) { { user: { name: '' } } }

      it 'is expected to render new template' do
        is_expected.to render_template(:new)
      end

      it 'is expected to add errors to name attribute' do
        expect(assigns[:user].errors[:name]).to eq(['can\'t be blank'])
      end
    end
  end
end
