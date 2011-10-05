class AddUserIdToQuestions < ActiveRecord::Migration
  def change
    add_column :rostra_questions, :user_id, :integer
  end
end
