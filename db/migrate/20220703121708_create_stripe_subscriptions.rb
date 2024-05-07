# frozen_string_literal: true

class CreateStripeSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :stripe_subscriptions do |t|
      t.references :stripe_plan, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :active, default: true
      t.string :stripe_id

      t.timestamps
    end
  end
end
