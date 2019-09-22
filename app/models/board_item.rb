class BoardItem < ApplicationRecord
  belongs_to :board
  validates :description, length: { in: 2..20 }
end
