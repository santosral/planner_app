class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true, uniqueness: true
end
