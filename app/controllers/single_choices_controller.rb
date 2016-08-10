class SingleChoicesController < ApplicationController

  def new
    @survey = Survey.find(params[:survey_id])
    @scq = SingleChoice.new
    @scq.options.build
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
                                             :description
                                          ])
    end

    def make_scq
      @survey = Survey.find(params[:survey_id])
      @scq = SingleChoice.new(description: single_choice_params[:description])
      @scq.save!
      single_choice_params[:options_attributes].each do |k,v|
        @scq.options.create!(v)
      end
      @scq.questions.create!(survey_id: @survey.id)
    end
end
