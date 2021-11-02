class CreateSupermarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :supermarkets do |t|
      t.string :market, null: false
      t.string :market_url
      t.text :detail 
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
