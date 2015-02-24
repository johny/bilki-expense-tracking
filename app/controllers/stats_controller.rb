class StatsController < ApplicationController

  before_filter :authenticate_user!

  def index

    @bills = current_user.bills.from_this_year

    @bills_by_month = @bills.group_by { |b| b.day.beginning_of_month }

    @spending = {}
    @spending[:months] = @bills_by_month.keys.collect{ |d| I18n.l(d, format: :month_and_year) }
    @spending[:data] = []

    @bills_by_month.each do |month, bills_for_month|

      sum = 0

      bills_for_month.each do |bill|
        sum += bill.amount_money
      end

      @spending[:data] << Money.new(sum).to_f

    end




  end

end
