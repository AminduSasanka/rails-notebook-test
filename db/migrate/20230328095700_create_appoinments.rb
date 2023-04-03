class CreateAppoinments < ActiveRecord::Migration[7.0]
  def change
    create_table :appoinments do |t|
      t.integer :user_id, foreign_key: true
      t.integer :lecture_id, foreign_key: true

      t.timestamps
    end
  end
end
