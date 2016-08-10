class ResponsesController < ApplicationController

  def new
    session[:survey_id] = params[:survey_id]
    @survey = Survey.find(session[:survey_id])
    @response = @survey.responses.build
    @mcqs = @response.survey.multi_choices
    @scqs = @response.survey.single_choices
    @rqs = @response.survey.number_ranges
    # raise
  end

  def create
    @response = Response.create!(response_params)
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

end
