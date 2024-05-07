# frozen_string_literal: true

module StripeServices
  class SubscriptionUpdater < ApplicationService
    attr_reader :subscription_id, :price_id

    def initialize(price_id, subscription_id)
      super()
      @subscription_id = subscription_id
      @price_id = price_id
    end

    def call
      Stripe::Subscription.update(
        @subscription_id,
        {
          items: [
            { price: @price_id }
          ]
        }
      )
    end
  end
end
