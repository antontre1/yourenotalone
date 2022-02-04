class FavoritePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all
      scope.where(user: user)
    end
  end

  def show?
    return true
  end

  def index?
    return true
  end

  def destroy?
    record.user == user || user.admin
  end

  def  create_fav_th?
    return true
  end

end
