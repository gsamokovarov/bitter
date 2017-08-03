class CreateCredentials < ActiveRecord::Migration[5.1]
  def change
    create_table :credentials do |t|
      t.string :password_digest, null: false
      t.belongs_to :authorizable, polymorphic: true, null: false

      t.timestamps
    end

    remove_column :users, :password_digest, :string
  end
end
