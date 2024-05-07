# frozen_string_literal: true

class ChangeNullStripePlan < ActiveRecord::Migration[5.2]
  def change
    change_column_null :stripe_plans, :name, false
    change_column_null :stripe_plans, :price_cents, false
    change_column_null :stripe_plans, :stripe_price_id, false
  end
end
