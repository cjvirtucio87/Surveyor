class NumberRangesController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @number_range = NumberRange.new
  end

  def create
    make_number_range
    redirect_to new_survey_question_path(@survey)
  end

  private
    def number_range_params
      params.require(:number_range).permit(:description,
                                           :max)
    end

    def make_number_range
      @survey = Survey.find(params[:survey_id])
      @number_range = NumberRange.create!(number_range_params)
      @number_range.questions.create!(survey_id: @survey.id)
      raise
    end
end
