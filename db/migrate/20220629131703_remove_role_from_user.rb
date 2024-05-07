# frozen_string_literal: true

class RemoveRoleFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :role, :integer
  end
end
