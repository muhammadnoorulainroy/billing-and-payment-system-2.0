# frozen_string_literal: true

class CreateFeaturePlanss < ActiveRecord::Migration[5.2]
  def change
    create_table :feature_plans do |t|
      t.references :plan, foreign_key: true
      t.references :featrue, foreign_key: true
      t.integer :usage
      t.integer :max_unit_limit

      t.timestamps
    end
  end
end
