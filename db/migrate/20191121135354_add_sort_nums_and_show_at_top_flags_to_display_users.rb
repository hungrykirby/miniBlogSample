class AddSortNumsAndShowAtTopFlagsToDisplayUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :display_users, :sort_num, :integer
    add_column :display_users, :show_at_top_flag, :boolean, default: false
  end
end
