class AnswersController < ApplicationController
  before_action :set_question!

  def create
    # render plain: params
    @answer = @question.answers.build answer_params
      if @answer.save
        flash[:success] = "Answer created!"
        redirect_to question_path(@question)
      else
        @answers = Answer.order created_at: :desc
        render 'questions/show'
    end
  end
 
  def destroy
    @answer = @question.answers.find params[:id]
    @answer.destroy
    flash[:success] = "Answer deleted!"
    redirect_to question_path(@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_question!
    @question = Question.find id: params[:question_id]
  end

end

