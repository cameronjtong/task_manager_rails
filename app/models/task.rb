class Task < ApplicationRecord
  belongs_to :list
  validates(:content, presence: true, length: {maximum: 60})
  validates(:list_id, presence: true)
end
