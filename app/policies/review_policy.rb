class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user == user
  end

  def update?
    user == user
  end

  def destroy?
    user == user
  end

  def show?
    true
  end
end
