class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :actual_question
      t.string :category
      t.string :difficulty_level
      t.string :answer
      t.datetime :submitted_at

      t.timestamps
    end
  end
end
