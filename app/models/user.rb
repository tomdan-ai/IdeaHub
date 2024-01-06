class User < ApplicationRecord
    has_many :articles, dependent: :destroy
    has_many :comments, dependent: :destroy

    # Adding Authentication-related fields
    validates :email, presence: true, uniqueness:true
    validates_format_of :email, with: /\A[^@\s]+@[^@\s]+\z/

    has_secure_password
  end
  