class CreateAnswersTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:answers) do |t|
      t.column(:name, :string)
      t.column(:question_id, :int)

      t.timestamps()
    end
  end
end
