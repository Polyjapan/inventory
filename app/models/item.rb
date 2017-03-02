class Item < ApplicationRecord
  has_many :lines
  validates :name, presence: :true, uniqueness: true
end
