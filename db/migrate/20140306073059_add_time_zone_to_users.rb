class AddTimeZoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :time_zone, :string
    add_column :users, :pwd, :string
  end
end
