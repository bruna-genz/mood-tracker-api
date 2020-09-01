class AddInputTypeToMoodElements < ActiveRecord::Migration[6.0]
  def change
    add_column :mood_elements, :input_type, :string
  end
end
