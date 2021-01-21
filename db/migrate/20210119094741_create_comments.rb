class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
