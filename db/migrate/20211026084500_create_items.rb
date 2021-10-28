class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :thing,  null: false
      t.text       :explanation
      t.integer    :category_id, null: false
      t.date       :expiry, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
