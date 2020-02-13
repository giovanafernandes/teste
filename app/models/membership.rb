class Membership < ApplicationRecord
    belongs_to :card, optional: true
end
