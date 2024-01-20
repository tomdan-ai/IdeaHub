class AccountManager < ApplicationRecord
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def verify_email

  end

  def reset_password
    
  end
end
