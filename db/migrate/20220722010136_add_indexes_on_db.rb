# frozen_string_literal: true

class AddIndexesOnDb < ActiveRecord::Migration[5.2]
  def change
    change_table :stripe_plans, bulk: false do |t|
      t.index :name, unique: true
      t.index :stripe_price_id, unique: true
    end
  end
end
