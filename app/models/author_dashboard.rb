class AuthorDashboard < ApplicationRecord
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def articles
    user.articles.order(created_at: desc)
  end

  def recent_comments
    user.comments.order(created_at: desc).limit(5)
  end

end
