class List < ApplicationRecord
  validates(:name, presence: true, length: {maximum: 70})
end
