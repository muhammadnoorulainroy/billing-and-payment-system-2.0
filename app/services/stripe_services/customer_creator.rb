# frozen_string_literal: true

module StripeServices
  class CustomerCreator < ApplicationService
    attr_reader :email

    def initialize(email)
      super()
      @email = email
    end

    def call
      Stripe::Customer.create(email: @email)
    end
  end
end
