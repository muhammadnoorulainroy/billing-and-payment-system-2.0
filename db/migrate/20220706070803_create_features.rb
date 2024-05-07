# frozen_string_literal: true

# Migration
class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :name, index: true, unique: true, null: false
      t.integer :code, index: true, unique: true, null: false
      t.integer :usage, null: false
      t.integer :max_unit_limit, null: false
      t.decimal :unit_price, null: false

      t.timestamps
    end
  end
end
