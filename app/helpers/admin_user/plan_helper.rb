# frozen_string_literal: true

module AdminUser
  module PlanHelper
    def all_features
      Feature.all
    end
  end
end
