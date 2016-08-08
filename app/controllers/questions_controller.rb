class QuestionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @survey = Survey.find(params[:survey_id])
  end

  def create
    @survey = Survey.find(question_params[:survey])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def questions_params
      params.require(:question).permit(:id)
    end

    def extract_questionable
      resource, id = request.path.split('/')[1,2]
      resource.singularize
              .constantize
              .find(id)
    end
end
