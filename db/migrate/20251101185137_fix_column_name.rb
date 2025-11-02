class FixColumnName < ActiveRecord::Migration[8.0]
  def change
    rename_column :connections, :followed_id, :followee_id
  end
end
