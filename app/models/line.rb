class Line < ApplicationRecord
  belongs_to :location
  belongs_to :item
  has_and_belongs_to_many :categories

  validates :item_id, presence: :true
  validates :location_id, presence: :true
end
