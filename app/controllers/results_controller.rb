class ResultsController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_result_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    @test_passage.current_question.gists.build(url: result.url, user: current_user).save!

    flash_options = if result
                      { notice: t('gist.success', url: result.html_url) }
                    else
                      { alert: t('gist.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = Result.find(params[:id])
  end
end
