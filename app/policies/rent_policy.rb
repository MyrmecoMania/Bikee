class RentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    !record.bike.user == user
  end

  def update?
    record.user == user # && !record.bike.user == user
  end

  def destroy?
    record.user == user || record.bike.user == user
  end
end
