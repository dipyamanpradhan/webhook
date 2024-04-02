class DataEntry < ApplicationRecord
  before_create :generate_verification_token

  private

  def generate_verification_token
    self.verification_token = SecureRandom.hex(16)
  end
end
