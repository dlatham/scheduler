class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :phone
      t.string :city
      t.string :state
      t.string :dogname
      t.string :breed
      t.text :comments
      t.datetime :consultation

      t.timestamps
    end
  end
end
