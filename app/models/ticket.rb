class Ticket < ApplicationRecord
  after_create :generate_qr_code

  def generate_qr_code
    self.info = SecureRandom.hex
    save
  end
end
