class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :email, limit: 100, null: false, default: ""
      t.string :password_digest, null: false, default: ""

      t.timestamps
    end
  end
end