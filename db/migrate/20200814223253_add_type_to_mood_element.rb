class AddTypeToMoodElement < ActiveRecord::Migration[6.0]
  def change
    add_column :mood_elements, :type, :string
  end
end
