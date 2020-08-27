class MoodElementsController < ApplicationController
  def create
    @mood_element = MoodElement.new(mood_element_params)
    if @mood_element.save
      render json: {
        status: 'created',
        mood_element: @mood_element
      }
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: 422
    end
  end

  def index
    @mood_elements = MoodElement.all
    if @mood_elements
      render json: {
        mood_elements: @mood_elements
      }
    else
      render json: {
        mood_elements: ['no mood elements found']
      }, status: 500
    end
  end

  def destroy
    @mood_element = MoodElement.find(params[:id])
    @mood_element.destroy
  end

  private

  def mood_element_params
    params.require(:mood_element).permit(:name)
  end
end
