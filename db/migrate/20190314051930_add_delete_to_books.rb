class AddDeleteToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :delete_flag, :boolean, default: false, null: false
  end
end
