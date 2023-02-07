class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]

  # GET /questions
  def index
    if current_moderator
      @questions = Question.includes(:author).all
    else
      @questions = Question.includes(:author).where.not(answer: nil).all
    end

    render json: @questions
  end

  # GET /questions/1
  def show
    render json: @question
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
    @question.author = Author.find_by(name: params[:author_name])
    @question.save!
    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  def update
    if current_moderator
      @question = Question.find(params[:id])
      @question.update!(question_params)
      render json: { message: 'Question updated' }, status: :ok
    else
      render json: {error: 'Not Authorized'}, status: :unauthorized
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:actual_question, :category, :difficulty_level, :answer, :submitted_at)
    end
end
