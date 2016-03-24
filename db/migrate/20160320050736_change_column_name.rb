class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :posts, :worked_out?, :worked_out
  end
end
