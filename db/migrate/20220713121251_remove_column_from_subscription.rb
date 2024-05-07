# frozen_string_literal: true

class RemoveColumnFromSubscription < ActiveRecord::Migration[5.2]
  def change
    remove_column :subscriptions, :usage, :integer
  end
end
