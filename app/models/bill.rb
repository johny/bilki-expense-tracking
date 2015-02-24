class Bill < ActiveRecord::Base

  belongs_to :user

  PAYMENT_METHODS = ['cash', 'card', 'bank']

  monetize :amount_money, as: "amount",
    numericality: {
      greater_than: 0
    }

  default_scope -> {
    order(day: :desc)
  }

  scope :from_today, -> {
    where(day: Date.today)
  }

  scope :from_this_month, -> {
    where("day > ? AND day < ?",
      Date.today.beginning_of_month,
      Date.today.end_of_month)
    .order(day: :desc)
  }

  scope :from_this_year, -> {
    Bill.unscoped.where('day > ? AND day < ?',
      Date.today.beginning_of_year,
      Date.today.end_of_year)
    .order(day: :asc)

  }

end
