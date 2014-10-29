class CatRentalRequest < ActiveRecord::Base
  STATUS = ["PENDING", "APPROVED", "DENIED"]
  
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: STATUS
  validate :overlapping_approved_requests
  validate :no_time_traveling
  belongs_to :cat
  
  def overlapping_requests?(cat1, cat2)
    (cat1.start_date <= cat2.end_date && cat1.end_date >= cat2.start_date) ||
    (cat2.start_date <= cat1.end_date && cat2.end_date >= cat1.start_date)
  end

  def overlapping_approved_requests
    @rental_requests = CatRentalRequest.where('status = ?', 'APPROVED')
    
    @rental_requests.each do |request|
      next if request == self
      return false if overlapping_requests?(self, request)
    end
    true
  end
  
  def no_time_traveling
    self.start_date < self.end_date
  end
  
  def approve!
    CatRentalRequest.transaction do
      self.status = "APPROVED" 
    
      rental_requests = CatRentalRequest.where('status = ?', 'PENDING')
      rental_requests.each do |request|
        request.deny! if overlapping_requests?(self, request)
        request.save
      end
    end
    puts "Approved for #{self.cat}!!"
  end
  
  def deny!
    self.status = "DENIED"
  end
end