class Location < ApplicationRecord
  has_many :lines
  validates :name, presence: :true, uniqueness: true
end
