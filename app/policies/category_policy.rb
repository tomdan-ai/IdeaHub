class CategoryPolicy < ApplicationPolicy
  def create?
    user.admin? || user.editor?
  end

  def update?
    user.admin? || user.editor?
  end

  def destroy?
    user.admin?
  end
end
