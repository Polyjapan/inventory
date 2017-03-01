class Line < ApplicationRecord
  belongs_to :location
  belongs_to :item

  validates :item_id, presence: :true
  validates :location_id, presence: :true
end
