# frozen_string_literal: true

class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :user, foreign_key: true
      t.references :plan, foreign_key: true
      t.date :billing_day

      t.timestamps
    end
  end
end
