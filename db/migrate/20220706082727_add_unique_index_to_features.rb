# frozen_string_literal: true

# Migration
class AddUniqueIndexToFeatures < ActiveRecord::Migration[5.2]
  def change
    remove_index :features, :name
    remove_index :features, :code
    add_index :features, :name, unique: true
    add_index :features, :code, unique: true
  end
end
