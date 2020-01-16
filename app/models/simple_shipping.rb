class SimpleShipping < ActiveRecord::Base
  belongs_to :m_shipping_request
  belongs_to :vehicle
  belongs_to :coupled_vehicle, class_name: "Vehicle"
  belongs_to :driver, class_name: "Employee"
  belongs_to :company
  belongs_to :billing_unit
  belongs_to :return_type
  
end
