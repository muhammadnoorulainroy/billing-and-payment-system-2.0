# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :plan_name, null: false
      t.decimal :amount, null: false
      t.string :buyer_name, null: false
      t.string :buyer_email, null: false, index: true

      t.timestamps
    end
  end
end
