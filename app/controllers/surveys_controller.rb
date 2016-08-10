class SurveysController < ApplicationController
  def index
  end

  def show
    @survey = Survey.find(params[:id])
    @mcqs = @survey.multi_choices
    @scqs = @survey.single_choices
    @rqs = @survey.number_ranges
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.create!(survey_params)
    redirect_to @survey
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def survey_params
      params.require(:survey).permit(:title,
                                     :description)
    end
end
