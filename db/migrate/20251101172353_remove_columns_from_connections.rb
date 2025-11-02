class RemoveColumnsFromConnections < ActiveRecord::Migration[8.0]
  def change
    change_table(:connections) do |t|
      t.remove :sender_id
      t.remove :receiver_id
    end
  end
end
