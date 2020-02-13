class Company < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :business_name, presence: true, uniqueness: true
    validates :city, presence: true
end
