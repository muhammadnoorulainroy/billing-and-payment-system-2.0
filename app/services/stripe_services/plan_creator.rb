# frozen_string_literal: true

module StripeServices
  class PlanCreator < ApplicationService
    attr_reader :price_cents, :name

    def initialize(price_cents, name)
      super()
      @price_cents = price_cents
      @name = name
    end

    def call
      Stripe::Price.create({
                             unit_amount: @price_cents,
                             currency: 'usd',
                             recurring: { interval: 'month' },
                             product_data: { name: @name }
                           })
    end
  end
end
