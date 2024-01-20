class ArticlePolicy < ApplicationPolicy
  # class Scope < Scope
  #   # NOTE: Be explicit about which records you allow access to!
  #   # def resolve
  #   #   scope.all
  #   # end
  # end
  def create?
    user.present? && user.author?
  end

  def update?
    user.present? && (record.author == user || user.editor?)
  end

  def destroy?
    user.present? && (record.author == user || user.editor?)
  end
end
