# frozen_string_literal: true

class CreateStripePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :stripe_plans do |t|
      t.string :name
      t.string :description
      t.integer :interval
      t.integer :price_cents
      t.string :stripe_price_id

      t.timestamps
    end
  end
end
