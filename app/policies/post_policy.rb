class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    author?
  end

  def create?
    true
  end

  def destroy?
    author?
  end

  def author?
    record.user == user
  end
end
