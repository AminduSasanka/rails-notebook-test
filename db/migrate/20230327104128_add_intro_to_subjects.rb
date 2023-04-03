class AddIntroToSubjects < ActiveRecord::Migration[7.0]
  def change
    add_column :subjects, :intro, :text
  end
end
