class AddNotesToPost < ActiveRecord::Migration
  def change
    add_column :posts, :notes, :text
  end
end
