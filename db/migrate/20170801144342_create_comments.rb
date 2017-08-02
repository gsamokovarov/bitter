class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :text, null: false
      t.belongs_to :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
