# frozen_string_literal: true

module BuyerUser
  module PlanHelper
    def not_subscribed_plans
      buyer_plans = current_user.plans
      Plan.left_joins(:subscriptions).where.not(id: buyer_plans)
    end

    def all_plans
      Plan.all
    end

    def all_features_of_plan(plan)
      plan.features
    end
  end
end
