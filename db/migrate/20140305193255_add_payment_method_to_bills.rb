class AddPaymentMethodToBills < ActiveRecord::Migration
  def change
    add_column :bills, :payment_method, :string
    add_index :bills, :payment_method, :unique => false
  end
end