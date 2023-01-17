class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :role, default: 0  # 0 = user, 1 = admin

      t.timestamps
    end
  end
end
