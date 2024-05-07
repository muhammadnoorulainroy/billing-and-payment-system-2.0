# frozen_string_literal: true

class Feature < ApplicationRecord
  has_many :feature_plans, dependent: nil
  has_many :plans, through: :feature_plans

  validates :name, :code, :max_unit_limit, :unit_price, presence: true
  validates :name, :code, uniqueness: true
  validates :code, length: { minimum: 3, maximum: 6 }
  validates :name, length: { minimum: 3, maximum: 20 }, name: true
end
