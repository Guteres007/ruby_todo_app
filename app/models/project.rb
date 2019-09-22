class Project < ApplicationRecord
  has_many :boards
  validates :name, length: { in: 3..20 }
  validates :description, length: { in: 3..20 }
end
