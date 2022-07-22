class Ticket < ApplicationRecord
  validates :info, presence: true  
  after_create :generate_qr_code

  def generate_qr_code
    # self.info = SecureRandom.hex
    booked_at = self.created_at.strftime('-%m-%d-%Y-%H-%M-%S')
    self.info = info.to_s + booked_at.to_s
    save
  end

  def unique_ticket_id
    id && ("ticket%.4d" % id)
  end
end
