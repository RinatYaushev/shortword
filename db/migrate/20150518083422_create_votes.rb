class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :likeable, polymorphic: true, index: true
      t.references :user, foreign_key: true, index: true
      t.integer :value, default: 0

      t.timestamps null: false
    end
  end
end
