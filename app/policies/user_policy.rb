class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def index?
    return true
  end

  def new?
    return true
  end

  #  def user?
  #   return true
  # end

  # def user_index?
  #   return true
  # end

  def create?
    return true
  end

  def edit?
    return true
  end

  def update?
    return true
  end

  def destroy?
    record.user == user
  end

end
