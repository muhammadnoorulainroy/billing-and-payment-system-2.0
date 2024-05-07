# frozen_string_literal: true

class CreateFeatrues < ActiveRecord::Migration[5.2]
  def change
    create_table :featrues do |t|
      t.string :name, null: false
      t.integer :code, index: true, null: false
      t.decimal :unit_price, null: false

      t.timestamps
    end
  end
end
