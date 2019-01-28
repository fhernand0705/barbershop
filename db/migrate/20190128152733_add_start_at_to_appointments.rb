class AddStartAtToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :start_at, :datetime
  end
end
