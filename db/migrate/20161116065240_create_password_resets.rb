class CreatePasswordResets < ActiveRecord::Migration[5.0]
  def change
    create_table :password_resets do |t|
      t.string :old_password
      t.string :password_digest

      t.timestamps
    end
  end
end
