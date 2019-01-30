class Contact < ApplicationRecord
    paginates_per 10
    validates :email, uniqueness: true, presence: true
    validates :phone, uniqueness: true, presence: true
end
