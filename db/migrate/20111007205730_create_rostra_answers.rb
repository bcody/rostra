class CreateRostraAnswers < ActiveRecord::Migration
  def change
    create_table :rostra_answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.text :text

      t.timestamps
    end
  end
end
