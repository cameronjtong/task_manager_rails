class List < ApplicationRecord
  has_many :tasks
  validates(:name, presence: true, length: {maximum: 70})
end
