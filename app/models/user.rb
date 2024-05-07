# frozen_string_literal: true

class User < ApplicationRecord
  require 'stripe'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :stripe_id, presence: true, uniqueness: true

  has_one_attached :image

  before_validation :create_stripe_reference, on: %i[create update]

  def create_stripe_reference
    response = StripeServices::CustomerCreator.call(email)
    self.stripe_id = response.id
  end

  def retrieve_stripe_reference
    StripeServices::CustomerRetriever.call(stripe_id)
  end
end
