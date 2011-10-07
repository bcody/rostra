module Rostra
  class QuestionsController < ApplicationController
    load_and_authorize_resource

    def index
      @questions = Question.order('created_at desc')
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
      if @question.save
        redirect_to questions_path, notice: 'Your question has been posted.'
      else
        render :new
      end
    end

    def update
      if @question.update_attributes(params[:question])
        redirect_to @question, notice: 'Question was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @question.destroy
      redirect_to questions_url
    end
  end
end
