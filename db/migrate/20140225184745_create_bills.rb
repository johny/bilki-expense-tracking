class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|

      t.integer :user_id, null: false

      t.integer :amount_money, default: 0, null: false
      t.string :description

      t.date :day

      t.timestamps
    end
  end
end
