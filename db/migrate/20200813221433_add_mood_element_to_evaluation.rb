class AddMoodElementToEvaluation < ActiveRecord::Migration[6.0]
  def change
    add_reference :evaluations, :mood_element, null: false, foreign_key: true
  end
end
