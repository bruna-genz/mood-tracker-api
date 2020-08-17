class EvaluationsController < ApplicationController
  def create
    @evaluation = current_user.evaluations.build(evaluation_params)
    if @evaluation.save
      render json: {
        status: "created",
        evaluation: @evaluation,
        moodElementName: find_mood_element(evaluation_params[:mood_element_id])
      }
    else
      render json: {
        status: 500,
        errors: @evaluation.errors.full_messages
      }
    end
  end

  def index 
    @evaluations = current_user.evaluations
    if @evaluations 
      render json: {
        evaluations: @evaluations
      }
    else
      render json: {
        status: 500,
        errors: 'no evaluations found for current user'
      }
    end
  end

  def destroy
    @evaluation = Evaluation.find(params[:id])
    @evaluation.destroy
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(:evaluation, :mood_element_id)
  end

  def find_mood_element(id)
    mood_element = MoodElement.find(id)
    mood_element_name = mood_element.name
  end
end