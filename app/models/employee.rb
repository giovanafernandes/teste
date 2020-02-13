class Employee < ApplicationRecord
  belongs_to :job
  belongs_to :work, required: false
end
