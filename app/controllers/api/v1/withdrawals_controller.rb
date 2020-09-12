class Api::V1::WithdrawalsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, only: [:create]
  before_action :set_withdrawal, only: [:show]

  def index
    @withdrawals = Withdrawal.where(user: current_user)
  end

  def show
    if @withdrawal.user == current_user
      @withdrawal 
    else
      render json: { message: "You did not make this withdrawal. You are not allowed to see it."}
    end
  end

  def create
    @withdrawal = Withdrawal.new(withdrawal_params)
    # .include(:user)
    # NO N+1 Queries! Lets pull the user here.
    @withdrawal.banknotes = WithdrawalService.new(@withdrawal.amount).notes_amount
    @withdrawal.user = current_user
    if @withdrawal.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_withdrawal
    @withdrawal = Withdrawal.find(params[:id])
  end

  def withdrawal_params
    params.require(:withdrawal).permit(:amount, :user_id)
  end

    def render_error
      render json: { errors: @withdrawal.errors.full_messages },
        status: :unprocessable_entity
    end
end

