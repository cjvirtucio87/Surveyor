class MultiChoicesController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @mcq = MultiChoice.new
  end

  def create
    make_mcq
    redirect_to new_survey_question_path(@survey)
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
    def multi_choice_params
      params.require(:multi_choice).permit(:description,
                                           options_attributes: [
                                           :id,
                                           :description,
                                           :optionable_type,
                                           :optionable_id
                                        ])
    end

    def make_mcq
      @survey = Survey.find(params[:survey_id])
      @mcq = MultiChoice.create!(multi_choice_params)
      @mcq.questions.create!(survey_id: @survey.id)
    end
end
