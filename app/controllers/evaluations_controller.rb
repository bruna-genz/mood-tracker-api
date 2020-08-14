class EvaluationsController < ApplicationController
  def create
    @evaluation = current_user.evaluations.build(evaluation_params)
    if @evaluation.save
      render json: {
        status: "created",
        evaluation: @evaluation
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

  def
    params.require(:evaluation).permit(:evaluation)
  end
end
