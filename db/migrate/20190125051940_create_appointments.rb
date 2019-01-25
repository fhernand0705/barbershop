class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.textstart_at :note
      t.integer :user_id
      t.integer :shop_id
      t.integer :service_id
      t.integer :schedule_id

      t.timestamps
    end
  end
end
