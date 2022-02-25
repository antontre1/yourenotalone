class ArticlePolicy < ApplicationPolicy
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

  def create?
    return true
  end

  def create_art_selectedth?
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
