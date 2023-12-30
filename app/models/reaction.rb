class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :reactable, polymorphic: true  # This could refer to Article or Comment
  # Validation for reaction_type - you can add custom validation rules as needed
  validates :reaction_type, inclusion: { in: %w(like dislike), message: "%{value} is not a valid reaction type" }
end
