class CreateDisplayUserContents < ActiveRecord::Migration[6.0]
  def change
    create_table :display_user_contents do |t|
      t.timestamps
      t.string :title
      t.text :body
      t.references :display_user, foreign_key: true
    end
  end
end
