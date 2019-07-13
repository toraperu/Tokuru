class BanksController < ApplicationController
  def new
    @bank = Bank.new
  end

  def create
    @bank = current_user.banks.build(bank_params)
    if @bank.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def bank_params
    params.require(:bank).permit(:name, :branch, :number)
  end
end
