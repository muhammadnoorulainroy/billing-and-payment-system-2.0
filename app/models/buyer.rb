# frozen_string_literal: true

class Buyer < User
  has_many :subscriptions, dependent: :destroy
  has_many :plans, through: :subscriptions
end
