# frozen_string_literal: true

class Transaction < ApplicationRecord
  validates :plan_name, :amount, :buyer_name, :buyer_email, presence: true

  scope :most_recent_transactions_first, -> { order('created_at DESC') }
end
