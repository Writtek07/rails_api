class CreateModerators < ActiveRecord::Migration[6.0]
  def change
    create_table :moderators do |t|
      t.string :username
      t.string :password_digest
      t.string :name

      t.timestamps
    end
  end
end
