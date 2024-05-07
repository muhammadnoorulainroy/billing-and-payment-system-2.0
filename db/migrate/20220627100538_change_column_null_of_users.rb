# frozen_string_literal: true

class ChangeColumnNullOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :name, true
  end
end
