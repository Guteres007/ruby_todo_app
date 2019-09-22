class Board < ApplicationRecord
  belongs_to :project
  has_many :board_items
  
  validates :name, length: { in: 3..20 }
  validates :description, length: { in: 3..20 }
end
