# frozen_string_literal: true

class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :monthly_fee

      t.timestamps
    end
  end
end
