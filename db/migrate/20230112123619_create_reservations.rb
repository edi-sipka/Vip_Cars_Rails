class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, null:false, foreign_key: true
      t.references :car, null:false, foreign_key: true

      t.string :city
      t.datetime :reservation_date
      t.datetime :returning_date
      
      t.timestamps
    end
  end
end
