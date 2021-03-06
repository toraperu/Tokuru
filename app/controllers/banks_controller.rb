class BanksController < ApplicationController
  def new
    @bank = Bank.new
  end

  def create
    @bank = current_user.banks.build(bank_params)
    if @bank.save
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = '銀行名、支店名、口座番号および名義人を入力してください'
      render :new
    end
  end


  def show
    @bank = Bank.find(params[:id])
  end

  def edit
    @bank = Bank.find(params[:id])
  end

  def update
    @bank = Bank.find(params[:id])
    if @bank.update(bank_params)
      redirect_to user_banks_path
    else
      render :edit
    end
  end

  def destroy
    @bank = Bank.find(params[:id])
    @bank_id = @bank.id
    @bank.destroy
  end

  private

  def bank_params
    params.require(:bank).permit(:name, :branch, :number, :holder)
  end
end
