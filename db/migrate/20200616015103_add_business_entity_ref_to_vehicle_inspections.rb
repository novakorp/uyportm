class AddBusinessEntityRefToVehicleInspections < ActiveRecord::Migration
  def change
    add_reference :vehicle_inspections, :business_entity, index: true, foreign_key: true
  end
end
