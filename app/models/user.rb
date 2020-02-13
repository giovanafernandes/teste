class User < ApplicationRecord
  belongs_to :user_type
  belongs_to :branch, required: false
  belongs_to :access
  belongs_to :job, required: false
  has_secure_password
end
