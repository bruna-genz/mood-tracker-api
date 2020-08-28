class EvaluationsController < ApplicationController
  def create
    @evaluation = current_user.evaluations.build(evaluation_params)
    if @evaluation.save
      @evaluation[:mood_element_name] = find_mood_element(evaluation_params[:mood_element_id])
      render json: {
        status: 'created',
        evaluation: @evaluation
      }
    else
      render json: {
        errors: @evaluation.errors.full_messages
      }, status: 422
    end
  end

  def index
    @evaluations = current_user ? current_user.evaluations : nil
    if @evaluations
      @evaluations.each do |evaluation|
        evaluation[:mood_element_name] = find_mood_element(evaluation.mood_element_id)
      end
      render json: {
        evaluations: @evaluations
      }
    else
      render json: {
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
    mood_element.name
  end
end
