# frozen_string_literal: true

class SubscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.type == 'Buyer'
  end

  def new?
    @user.type == 'Buyer'
  end

  def create?
    @user.type == 'Buyer'
  end

  def show_usage?
    @user.type == 'Buyer'
  end

  def increase_usage?
    @user.type == 'Buyer'
  end

  def max_limit?
    @user.type == 'Buyer'
  end

  def destroy?
    @user.type == 'Buyer'
  end
end
