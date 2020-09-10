class Api::V1::WithdrawalsController < Api::V1::BaseController

  def create
    @withdrawal = Withdrawal.new(withdrawal_params)
  end

  private

  def withdrawal_params
    params.require(:withdrawal).permit(:amount)
  end

end
