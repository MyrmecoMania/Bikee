class RentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    create?
  end

  def create?
    record.bike.user != user
  end

  def edit?
    destroy?
  end

  def update?
    destroy?
  end

  def destroy?
    record.user == user || record.bike.user == user
  end
end
