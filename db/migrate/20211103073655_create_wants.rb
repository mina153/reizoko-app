class CreateWants < ActiveRecord::Migration[6.0]
  def change
    create_table :wants do |t|
      t.string :wanted, null: false
      t.text :account
      t.integer :categori_id, null: false
      t.references :user, null: false, foreign_key: true
      t.references :supermarket, null: false, foreign_key: true
      t.timestamps
    end
  end
end
