module Rostra
  class AnswersController < ApplicationController
    load_and_authorize_resource
    before_filter :fetch_question

    def create
      if @answer.save
        redirect_to question_path(@question, anchor: "rostra_answer_#{@answer.id}")
      else
        redirect_to question_path(@question, anchor: 'new_rostra_answer')
      end
    end

    def edit
    end

    def update
      if @answer.update_attributes(params[:answer])
        redirect_to question_path(@question, anchor: "rostra_answer_#{@answer.id}")
      else
        render :edit
      end
    end

    private

    def fetch_question
      @question = Question.find(params[:question_id])
    end
  end
end
