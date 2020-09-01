class AddUserToEvaluation < ActiveRecord::Migration[6.0]
  def change
    add_reference :evaluations, :user, null: false, foreign_key: true
  end
end
