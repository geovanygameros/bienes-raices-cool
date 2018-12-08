class Property < ApplicationRecord
  has_many :property_pictures

  # Se valida la presencia del id de Easy Broker ya que es el campo con el que se sincronizará la información del XML
  validates :easy_broker_id, presence: true

  ACTIVE = 1
  DELETED = 99

end
