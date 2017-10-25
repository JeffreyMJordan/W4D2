class Cat < ApplicationRecord
  validates :color, :sex, :name, :description, :birth_date, presence: true
  validates :color, inclusion: { in: ['Red', 'White', 'Blue'] }
  validates :sex, inclusion: { in: ['M', 'F'] }

  has_many(:rentals,
    foreign_key: :cat_id,
    primary_key: :id,
    class_name: 'CatRentalRequest'
  )
end
