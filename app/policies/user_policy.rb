# app/policies/user_policy.rb
class UserPolicy < ApplicationPolicy
  def edit?
    user == record || user.admin? || user.editor?
  end

  def update?
    user == record || user.admin? || user.editor?
  end

  def update_profile?
    user.present? && user == record
  end

  def update_password?
    user.present? && user == record
  end
  
end
