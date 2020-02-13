class Task < ApplicationRecord
    validates :isFinished, required: false
    validates :justification, required: false
end
