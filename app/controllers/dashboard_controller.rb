# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  def author_dashboard
    # Implement actions specific to author dashboard
    # Example: List user's articles, recent comments, etc.
  end

  def admin_dashboard
    authorize :dashboard, :admin?

    # Implement actions specific to admin dashboard
    # Example: Show statistics, manage reported content, etc.
  end
end
