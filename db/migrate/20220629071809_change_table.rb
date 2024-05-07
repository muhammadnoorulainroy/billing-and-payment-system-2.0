# frozen_string_literal: true

class ChangeTable < ActiveRecord::Migration[5.2]
  def up
    change_table :feature_plans, bulk: true do |t|
      t.remove :usage
      t.remove :max_unit_limit
    end

    change_table :featrues, bulk: true do |t|
      t.integer :usage
      t.integer :max_unit_limit
    end
  end
end
