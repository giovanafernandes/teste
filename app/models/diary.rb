class Diary < ApplicationRecord
  belongs_to :work
  belongs_to :weather
end
