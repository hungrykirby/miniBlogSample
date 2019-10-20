class AddColumnsToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :adminname, :string
    add_column :admins, :kana, :string
  end
end
