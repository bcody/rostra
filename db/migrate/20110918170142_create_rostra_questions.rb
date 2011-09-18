class CreateRostraQuestions < ActiveRecord::Migration
  def change
    create_table :rostra_questions do |t|
      t.string :title
      t.text :details

      t.timestamps
    end
  end
end
