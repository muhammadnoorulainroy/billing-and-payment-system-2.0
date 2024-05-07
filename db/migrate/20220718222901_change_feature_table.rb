# frozen_string_literal: true

class ChangeFeatureTable < ActiveRecord::Migration[5.2]
  def up
    change_column :features, :code, :string
  end

  def down
    change_column :features, :code, :integer
  end
end
