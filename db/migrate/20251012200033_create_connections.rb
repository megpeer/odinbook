class CreateConnections < ActiveRecord::Migration[8.0]
  def change
    create_table :connections do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
