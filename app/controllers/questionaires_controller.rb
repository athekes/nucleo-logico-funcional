class QuestionairesController < ApplicationController
  before_action :set_questionaire, only: %i[ show update destroy ]

  # GET /questionaires
  def index
    @questionaires = Questionaire.all

    render json: @questionaires
  end

  # GET /questionaires/1
  def show
    render json: @questionaire
  end

  # POST /questionaires
  def create
    @questionaire = Questionaire.new(questionaire_params)

    if @questionaire.save
      render json: @questionaire, status: :created, location: @questionaire
    else
      render json: @questionaire.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questionaires/1
  def update
    if @questionaire.update(questionaire_params)
      render json: @questionaire
    else
      render json: @questionaire.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questionaires/1
  def destroy
    @questionaire.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionaire
      @questionaire = Questionaire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def questionaire_params
      params.fetch(:questionaire, {}).permit!
    end
end
