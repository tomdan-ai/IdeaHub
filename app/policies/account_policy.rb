# app/policies/account_policy.rb
class AccountPolicy < ApplicationPolicy
  def verify_email?
    user.present? && user == record
  end

  def reset_password?
    user.present? && user == record
  end
end
