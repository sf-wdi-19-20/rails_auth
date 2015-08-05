class User < ActiveRecord::Base

  has_secure_password
  # note: has_secure_password automatically adds validations
  # for presence of password, password length < 72 characters,
  # and password_confirmation

  validates :password, length: { minimum: 6 }

  validates :email,
    presence: true,
    uniqueness: true,
    format: {
      with: /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})\z/,
      message: "not a valid format"
    }

end