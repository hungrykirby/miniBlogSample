class AddDateToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :created_at, :timestamps
    add_column :admins, :updated_at, :timestamps
  end
end
