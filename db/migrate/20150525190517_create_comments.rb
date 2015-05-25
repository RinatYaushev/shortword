class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post
      t.references :user

      t.text :text

      t.timestamps null: false
    end
  end
end
