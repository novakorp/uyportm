class CustomerShippingOrder < ActiveRecord::Base
  belongs_to :company
  belongs_to :customer
  has_many :shipping_requests
  
  
  validates :customer_id, presence: true
  
  validates :order_datetime, presence: true
  
  validates :shipping_date, presence: true
  
  
  before_save do
    if (@attributes["order_number"].nil? || @attributes["order_number"].to_i == 0)
      @attributes.delete("order_number")
      @changed_attributes.delete("order_number")
    end
  end
  
end
