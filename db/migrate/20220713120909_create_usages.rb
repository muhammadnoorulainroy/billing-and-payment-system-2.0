# frozen_string_literal: true

class CreateUsages < ActiveRecord::Migration[5.2]
  def change
    create_table :usages do |t|
      t.references :subscription, foreign_key: true
      t.references :feature, foreign_key: true
      t.integer :usage, null: false, default: 0

      t.timestamps
    end
  end
end
