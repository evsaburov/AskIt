class QuestionsController < ApplicationController
    
    def edit
        @question = Question.find_by id: params[:id]
    end

    def update
        @question = Question.find_by id: params[:id]
        if @question.update question_params
            redirect_to questions_path
        else
            render :new
        end
    end
    
    def index
        @questions = Question.all
    end

    def  new
        @question = Question.new
    end

    def create
        # render plain: params
        @question = Question.new question_params
        if @question.save
            redirect_to questions_path
        else
            render :new
        end
    end

    private

    def question_params
        params.require(:question).permit(:title, :body)
    end
end