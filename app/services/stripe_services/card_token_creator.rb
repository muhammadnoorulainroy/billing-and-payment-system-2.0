# frozen_string_literal: true

module StripeServices
  class CardTokenCreator < ApplicationService
    attr_reader :user_stripe_id, :card_number, :exp_month, :exp_year, :cvc

    def initialize(user_stripe_id, card_number, exp_month, exp_year, cvc)
      super()
      @user_stripe_id = user_stripe_id
      @card_number = card_number
      @exp_month = exp_month
      @exp_year = exp_year
      @cvc = cvc
    end

    def call
      Stripe::Customer.create_source(
        @user_stripe_id,
        { source: generate_card_token }
      )
    end

    def generate_card_token
      Stripe::Token.create({
                             card: {
                               number: @card_number,
                               exp_month: @exp_month,
                               exp_year: @exp_year,
                               cvc: @cvc
                             }
                           }).id
    end
  end
end
