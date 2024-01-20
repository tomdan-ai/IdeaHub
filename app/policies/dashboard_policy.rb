# app/policies/dashboard_policy.rb
class DashboardPolicy < ApplicationPolicy
  def admin?
    user.admin?
  end
end
