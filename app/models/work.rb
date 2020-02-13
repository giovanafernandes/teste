class Work < ApplicationRecord
  belongs_to :Company, required: false
  belongs_to :User, required: false
end
