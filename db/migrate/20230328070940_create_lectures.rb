class CreateLectures < ActiveRecord::Migration[7.0]
  def change
    create_table :lectures do |t|
      t.datetime :time
      t.string :instructor
      t.integer :subject_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
