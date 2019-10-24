class AddTypeAndHistryToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :login_notify_flag, :boolean, null: false, default: true
    add_column :admins, :auth_type, :integer, null: false, default: 1
  end
end
