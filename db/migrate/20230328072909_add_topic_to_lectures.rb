class AddTopicToLectures < ActiveRecord::Migration[7.0]
  def change
    add_column :lectures, :topic, :text
  end
end
