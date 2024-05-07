# frozen_string_literal: true

# Migration
class CreateFeaturePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :feature_plans do |t|
      t.references :plan, foreign_key: true
      t.references :feature, foreign_key: true

      t.timestamps
    end
  end
end
