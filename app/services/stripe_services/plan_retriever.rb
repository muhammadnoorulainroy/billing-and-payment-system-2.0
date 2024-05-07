# frozen_string_literal: true

module StripeServices
  class PlanRetriever < ApplicationService
    attr_reader :stripe_price_id

    def initialize(stripe_price_id)
      super()
      @stripe_price_id = stripe_price_id
    end

    def call
      Stripe::Price.retrieve(stripe_price_id)
    end
  end
end
