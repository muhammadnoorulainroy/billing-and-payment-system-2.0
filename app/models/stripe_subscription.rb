# frozen_string_literal: true

class StripeSubscription < ApplicationRecord
  attr_accessor :card_number, :exp_month, :exp_year, :cvc

  belongs_to :stripe_plan
  belongs_to :user

  validates :stripe_id, presence: true, uniqueness: true

  before_validation :create_stripe_reference, on: :create
  before_update :cancel_stripe_subscription, if: :subscription_inactive?

  def create_stripe_reference
    StripeServices::CardTokenCreator.call(user.stripe_id, card_number, exp_month, exp_year, cvc)
    response = StripeServices::SubscriptionCreator.call(user.stripe_id, stripe_plan.stripe_price_id)
    self.stripe_id = response.id
  end

  def update_subscription(price_id, subscription_id)
    StripeServices::SubscriptionUpdater.call(price_id, subscription_id)
  end

  def cancel_stripe_subscription
    StripeServices::SubscriptionCanceller.call(stripe_id)
  end

  def subscription_inactive?
    !active
  end
end
