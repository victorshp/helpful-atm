class Api::V1::WithdrawalsController < Api::V1::BaseController
  before_action :set_withdrawal, only: [:show]

  def index
    @withdrawals = Withdrawal.all
  end

  def show
  end

  def create
    withdrawal = Withdrawal.new(withdrawal_params)
    withdrawal.banknotes = WithdrawalService.new(withdrawal).notes_amount
    if withdrawal.successful
      withdrawal.save!
      render nothing: true, status: :created
    else
      render json: @withdrawal
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
