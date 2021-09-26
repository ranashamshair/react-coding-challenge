class Company < ApplicationRecord
  belongs_to :naics_code, optional: true
  belongs_to :business_structure, optional: true

  has_many :addresses
  has_one :primary_address, -> { where(address_type: 'primary') }, class_name: 'Address'

end
