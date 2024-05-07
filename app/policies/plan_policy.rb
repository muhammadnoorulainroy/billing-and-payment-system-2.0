# frozen_string_literal: true

class PlanPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.type == 'Admin'
  end

  def show?
    @user.type == 'Admin'
  end

  def new?
    @user.type == 'Admin'
  end

  def create?
    @user.type == 'Admin'
  end

  def update?
    @user.type == 'Admin'
  end

  def destroy?
    @user.type == 'Admin'
  end
end
