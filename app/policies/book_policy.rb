class BookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.admin?
  end

  # TODO, for reading
  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def show?
    true
  end
end
