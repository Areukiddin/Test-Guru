class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[index]
  before_action :question_params, only: %i[create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    questions = @test.questions.pluck(:body)

    render plain: questions.join("\n")
  end

  def show
    render plain: @question.body
  end

  def new; end

  def create
    question = Question.create(question_params)

    if question.save
      render plain: question.body
    else
      render :new
    end
  end

  def destroy
    @question.destroy!

    redirect_to tests_path(@question.test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_record_not_found
    render plain: 'Вопрос не найден'
  end
end