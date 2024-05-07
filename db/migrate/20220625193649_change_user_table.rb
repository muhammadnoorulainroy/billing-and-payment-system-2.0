# frozen_string_literal: true

class ChangeUserTable < ActiveRecord::Migration[5.2]
  def up
    change_table :users, bulk: true do |t|
      t.integer :role, null: false, default: 0
      t.remove :type, :string
    end
  end
end
