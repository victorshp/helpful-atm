class Api::V1::WithdrawalsController < Api::V1::BaseController
  before_action :set_withdrawal, only: [:show]

  def show
  end

  def create
    @withdrawal = Withdrawal.new(withdrawal_params)
  end

  private

  def set_withdrawal
    @withdrawal = Withdrawal.find(params[:id])
  end

  def withdrawal_params
    params.require(:withdrawal).permit(:amount, :banknotes)
  end

end
