class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def destroy?
    record.user == user
  end

end
