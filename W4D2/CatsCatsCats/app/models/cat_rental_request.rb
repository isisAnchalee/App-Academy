class CatRentalRequest < ActiveRecord::Base
  STATUS = ["PENDING", "APPROVED", "DENIED"]
  
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: STATUS
  validate :overlapping_approved_requests
  belongs_to :cat
  
  def overlapping_requests?(cat1, cat2)
    (cat1.start_date <= cat2.end_date && cat1.end_date >= cat2.start_date) ||
    (cat2.start_date <= cat1.end_date && cat2.end_date >= cat1.start_date)
  end

  def overlapping_approved_requests
    @rental_requests = CatRentalRequest.all.delete(self)
    @rental_requests.select! do |request|
      request.status == "APPROVED"
    end
    @rental_requests.each do |request|
      return false if overlapping_requests?(self, request)
    end
    true
  end

end
