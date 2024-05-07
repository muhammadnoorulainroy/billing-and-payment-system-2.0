# frozen_string_literal: true

module BuyerUser
  module SubscriptionsHelper
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

    def plan_available?
      not_sub_plans = not_subscribed_plans
      not_sub_plans.length.positive? ? true : false
    end

    def subscription_features(subscription)
      subscription.plan.features
    end

    def subscription_feature_usage(subscription, feature)
      subscription_feature = Usage.find_by(subscription_id: subscription.id, feature_id: feature.id)
      subscription_feature.usage
    end
  end
end
