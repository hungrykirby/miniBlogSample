class CreateDisplayUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :display_users do |t|
      t.string :name
      t.string :kana
      t.string :email
      t.text :description
      t.integer :age
      t.string :sex

      t.timestamps
    end
  end
end
