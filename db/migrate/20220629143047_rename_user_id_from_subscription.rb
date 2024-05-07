# frozen_string_literal: true

class RenameUserIdFromSubscription < ActiveRecord::Migration[5.2]
  def change
    rename_column :subscriptions, :user_id, :buyer_id
  end
end
