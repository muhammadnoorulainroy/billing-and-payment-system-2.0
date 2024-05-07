# frozen_string_literal: true

class ValidationOnStripeSubscriptions < ActiveRecord::Migration[5.2]
  def change
    change_column_null :stripe_subscriptions, :stripe_id, false
    add_index :stripe_subscriptions, :stripe_id, unique: true
    add_index :users, :stripe_id, unique: true
  end
end
