class ResponsesController < ApplicationController

  def new
    session[:survey_id] = params[:survey_id]
    @survey = Survey.find(session[:survey_id])
    @response = @survey.responses.build
    @mcqs = @response.survey.multi_choices
    @scqs = @response.survey.single_choices
    @rqs = @response.survey.number_ranges
  end

  def create
    @survey = Survey.find(session[:survey_id])
    @response = @survey.responses.build
    store_params
  end

  private

    def response_params
      params.require(:response).permit(:multi_choice,
                                       :single_choice,
                                       :range)
    end

    def current_survey
      @current_survey ||= Survey.find(session[:survey_id])
    end

    def store_params
      response_params[:multi_choice].each do |mcq|
        @response.option_choices.build(OptionChoice.create!(mcq))
      end
      @response.option_choices.build(response_params[:single_choice])
      @response.number_choices.build(response_params[:range])
    end

end
