class List < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates(:name, presence: true, length: {maximum: 70}, uniqueness: {case_sensitive: true})
end
