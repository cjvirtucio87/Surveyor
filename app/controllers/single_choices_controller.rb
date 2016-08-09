class SingleChoicesController < ApplicationController

  def new
    @survey = Survey.find(params[:survey_id])
    @scq = SingleChoice.new
  end

  def create
    make_scq
    redirect_to new_survey_question_path(@survey)
  end

  private
    def single_choice_params
      params.require(:single_choice).permit(:description,
                                            options_attributes: [
                                             :id,
                                             :description,
                                             :optionable_type,
                                             :optionable_id
                                          ])
    end

    def make_scq
      @survey = Survey.find(params[:survey_id])
      @scq = SingleChoice.create!(single_choice_params)
      @scq.questions.create!(survey_id: @survey.id)
    end
end
