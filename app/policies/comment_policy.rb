# app/policies/comment_policy.rb
class CommentPolicy < ApplicationPolicy
  def destroy?
    user == record.user || user.admin? || user.editor?
  end
end
