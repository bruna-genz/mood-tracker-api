class CreateMoodElements < ActiveRecord::Migration[6.0]
  def change
    create_table :mood_elements do |t|
      t.string :name

      t.timestamps
    end
  end
end
