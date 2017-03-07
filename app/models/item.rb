class Item < ApplicationRecord
  has_many :lines
  has_and_belongs_to_many :categories

  validates :name, presence: :true, uniqueness: true
end
