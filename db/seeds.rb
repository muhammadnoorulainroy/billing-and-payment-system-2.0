# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rails.logger.debug 'Creating Features'
Feature.create(
  [
    {
      name: 'Feature100', code: 'Fea100', unit_price: 1500, max_unit_limit: 35
    },
    {
      name: 'Feature101', code: 'Fea101', unit_price: 2500, max_unit_limit: 30
    },
    {
      name: 'Feature102', code: 'Fea102', unit_price: 3000, max_unit_limit: 25
    },
    {
      name: 'Feature103', code: 'Fea103', unit_price: 3500, max_unit_limit: 35
    }
  ]
)

Rails.logger.debug 'Creating Plans'
Plan.create(
  [
    {
      name: 'Plan1', monthly_fee: 2500
    },
    {
      name: 'Plan2', monthly_fee: 3000
    },
    {
      name: 'Plan3', monthly_fee: 3500
    }
  ]
)

Rails.logger.debug 'Creating Features for Plans'
FeaturePlan.create(
  [
    {
      plan_id: Plan.find_by(name: 'Plan1').id, feature_id: Feature.find_by(name: 'Feature101')
    },
    {
      plan_id: Plan.find_by(name: 'Plan2').id, feature_id: Feature.find_by(name: 'Feature102')
    },
    {
      plan_id: Plan.find_by(name: 'Plan3').id, feature_id: Feature.find_by(name: 'Feature103')
    }
  ]
)
