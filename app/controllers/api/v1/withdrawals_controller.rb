class Api::V1::WithdrawalsController < Api::V1::BaseController
  before_action :set_withdrawal, only: [:show]

  def index
    @withdrawals = Withdrawal.all
  end

  def show
  end

  def create
    @withdrawal = Withdrawal.new(withdrawal_params)
    # .include(:user)
    # NO N+1 Queries! Lets pull the user here.
    @withdrawal.banknotes = WithdrawalService.new(@withdrawal.amount).notes_amount
    if @withdrawal.save
      render :show, status: :created
    else
      render json: { errors: @withdrawal.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_withdrawal
    @withdrawal = Withdrawal.find(params[:id])
  end

  def withdrawal_params
    params.require(:withdrawal).permit(:amount)
  end

end

