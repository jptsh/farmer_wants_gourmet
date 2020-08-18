class CreateBoxes < ActiveRecord::Migration[6.0]
  def change
    create_table :boxes do |t|
      t.string :name
      t.integer :weight
      t.string :size
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
