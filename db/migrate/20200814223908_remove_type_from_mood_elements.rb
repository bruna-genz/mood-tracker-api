class RemoveTypeFromMoodElements < ActiveRecord::Migration[6.0]
  def change
    remove_column :mood_elements, :type, :string
  end
end
