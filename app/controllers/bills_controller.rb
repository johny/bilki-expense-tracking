class BillsController < ApplicationController

  before_filter :find_bill, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!

  def today
    @bills = current_user.bills.from_today
    @bill = Bill.new
  end

  def month
    @bills = current_user.bills.from_this_month
  end

  def index
    @bills = current_user.bills
  end

  def new
    @bill = Bill.new
  end

  def edit
  end

  def create
    params = bill_params
    @bill = Bill.new(params)
    @bill.user = current_user
    @bill.day = Date.today if @bill.day.blank?

    if @bill.save
      flash[:notice] = 'Wydatek zapisany.'
      redirect_to today_bills_path
    else
      flash.now[:error] = 'Niepoprawne dane.'
      @bills = current_user.bills.from_today
      render :action => "today"
    end
  end

  def update
    if @bill.update_attributes(bill_params)
      flash[:notice] = 'Wydatek zaktualizowany.'
      redirect_to bills_path
    else
      flash.now[:error] = 'Niepoprawne dane.'
      render :action => "edit"
    end
  end

  def destroy
    @bill.destroy
    flash[:notice] = 'Wydatek usunięty.'
    redirect_to bills_path
  end

  private

    def find_bill
      @bill = current_user.bills.find(params[:id])
    end

    def bill_params
      params.require(:bill).permit(:amount, :description, :day, :payment_method)
    end


end