# frozen_string_literal: true

module AdminUser
  class SubscriptionsController < ApplicationController
    layout 'admin'

    def index
      @pagy, @subscriptions = pagy(Subscription.all, items: 1)
    end
  end
end
