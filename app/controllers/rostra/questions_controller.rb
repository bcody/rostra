module Rostra
  class QuestionsController < ApplicationController

    def index
      @questions = Question.order('created_at desc')
    end

    def show
      @question = Question.find(params[:id])
    end

    def new
      @question = Question.new
    end

    def edit
      @question = Question.find(params[:id])
    end

    def create
      @question = Question.new(params[:question])
      if @question.save
        redirect_to questions_path, notice: 'Your question has been posted.'
      else
        render action: "new"
      end
    end

    def update
      @question = Question.find(params[:id])
      if @question.update_attributes(params[:question])
        redirect_to @question, notice: 'Question was successfully updated.'
      else
        render action: "edit"
      end
    end

    def destroy
      @question = Question.find(params[:id])
      @question.destroy
      redirect_to questions_url
    end
  end
end
