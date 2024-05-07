# frozen_string_literal: true

module StripeServices
  class SubscriptionCanceller < ApplicationService
    attr_reader :stripe_id

    def initialize(stripe_id)
      super()
      @stripe_id = stripe_id
    end

    def call
      Stripe::Subscription.delete(@stripe_id)
    end
  end
end
