class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def update?
    author?
  end

  def create?
    editor?
  end

  def destroy?
    author?
  end

  def search?
    true
  end

  def author?
    record.user == user
  end

  def editor?
    user.role == "editor"
  end
end
