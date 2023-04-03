class AddMaxAppoinmentsToLectures < ActiveRecord::Migration[7.0]
  def change
    add_column :lectures, :max_appoinments, :integer
  end
end
