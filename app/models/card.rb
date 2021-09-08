class Card < ApplicationRecord
  validates :model, :presence => true, :uniqueness => true
end
