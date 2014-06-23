class AddRoutesToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :routes, :string

  end
end
