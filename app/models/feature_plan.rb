# frozen_string_literal: true

class FeaturePlan < ApplicationRecord
  belongs_to :plan
  belongs_to :feature
end
