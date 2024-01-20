class ReportPolicy < ApplicationPolicy
  def create?
    user.present? && user != record.user
  end
end
