class Presence < ApplicationRecord
  belongs_to :diary
  belongs_to :employee
end
