class Category < ApplicationRecord
    has_many :tasks, dependent: :destroy

    validates :title, presence: true,
    length: { in: 2..20 },
    uniqueness: true

    validates :description, length: { minimum: 10, allow_blank: true }
end