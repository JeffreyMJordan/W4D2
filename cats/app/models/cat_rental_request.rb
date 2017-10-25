class CatRentalRequest < ApplicationRecord
  validates :status, inclusion: { in: ['PENDING', 'APPROVED', 'DENIED'] }
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :does_not_overlap_approved_request

  belongs_to(:cat,
    foreign_key: :cat_id,
    primary_key: :id,
    class_name: 'Cat'
  )

  def overlapping_requests
    CatRentalRequest
    .where(cat_id: self.cat_id)
    .where.not(id: self.id)
    .where.not('end_date < :start_date OR start_date > :end_date',
      end_date: end_date, start_date: start_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      errors.add(:overlap, "Cannot overlap an existing rental.")
    end
  end

  def approve!

    ActiveRecord::Base.transaction do
      overlapping_requests.update_all(status: 'DENIED')
      self.status = "APPROVED"
      self.save
    end

  end

  def deny!
    self.status = "DENIED"
    self.save
  end
end
