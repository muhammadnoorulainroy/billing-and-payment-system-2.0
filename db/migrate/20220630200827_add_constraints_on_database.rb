# frozen_string_literal: true

class AddConstraintsOnDatabase < ActiveRecord::Migration[5.2]
  def change
    change_column_null :featrues, :usage, false
    change_column_null :featrues, :max_unit_limit, false
    change_column_null :plans, :name, false
    change_column_null :plans, :monthly_fee, false
    change_column_null :subscriptions, :billing_day, false

    add_index :plans, :name, unique: true
    add_index :featrues, :name, unique: true
  end
end
