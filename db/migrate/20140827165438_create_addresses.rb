class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :street
      t.text :city
      t.text :state
      t.integer :zip

      t.timestamps
    end
  end
end
