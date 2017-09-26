class CreateSurveyDataTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:survey_data) do |t|
      t.column(:survey_id, :int)
      t.column(:question_id, :int)
      t.column(:answer_id, :int)

      t.timestamps()
    end
  end
end
