class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :reactions, as: :reactable, dependent: :destroy
end
