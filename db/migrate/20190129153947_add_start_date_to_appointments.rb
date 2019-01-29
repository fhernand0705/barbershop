class AddStartDateToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :start_date, :datetime
  end
end
