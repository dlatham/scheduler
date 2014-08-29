class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :zip
      t.string :fname
      t.string :lname
      t.string :email
      t.string :phone
      t.datetime :starttime
      t.datetime :endtime
      t.string :breed
      t.string :dogname
      t.text :comments

      t.timestamps
    end
  end
end
