class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    # Only restaurant owners can update
    record.user == user
  end

  def create?
    !user.nil?
  end

  def destroy?
    update?
  end
end
