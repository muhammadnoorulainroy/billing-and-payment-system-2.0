# frozen_string_literal: true

module StripeServices
  class SubscriptionCreator < ApplicationService
    attr_reader :user_stripe_id, :stripe_plan_price_id

    def initialize(user_stripe_id, stripe_plan_price_id)
      super()
      @user_stripe_id = user_stripe_id
      @stripe_plan_price_id = stripe_plan_price_id
    end

    def call
      Stripe::Subscription.create({
                                    customer: @user_stripe_id,
                                    items: [
                                      { price: @stripe_plan_price_id }
                                    ]
                                  })
    end
  end
end
