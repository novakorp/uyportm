class BusinessEntity < ActiveRecord::Base
  
  has_many :vehicle_inspections
  has_many :m_vehicle_inspections
  
end
