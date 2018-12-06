class Property < ApplicationRecord
  has_many :property_pictures
  before_create :set_status

  ACTIVE = 1
  DELETED = 99

  def set_status
    self.status = ACTIVE
  end

end
