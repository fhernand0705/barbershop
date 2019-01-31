class AddHoursToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :hours, :integer
  end
end
