# app/policies/user_policy.rb
class UserPolicy < ApplicationPolicy
  def edit?
    user == record || user.admin? || user.editor?
  end

  def update?
    user == record || user.admin? || user.editor?
  end
end
