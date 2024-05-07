# frozen_string_literal: true

# Migration
class DropUnnecessaryTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :books do |t|
      t.string :title
      t.integer :pages

      t.timestamps
    end

    drop_table :featrues do |t|
      t.string :name, null: false
      t.integer :code, index: true, null: false
      t.decimal :unit_price, null: false

      t.timestamps
    end
  end
end
