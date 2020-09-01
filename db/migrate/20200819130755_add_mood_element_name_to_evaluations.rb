class AddMoodElementNameToEvaluations < ActiveRecord::Migration[6.0]
  def change
    add_column :evaluations, :mood_element_name, :string
  end
end
