class Administrative::AlternativesController < AdministrativeController
  before_action :set_alternative, only: %i[ show update destroy ]

  # GET /alternatives
  def index
    @alternatives = Alternative.all

    render json: @alternatives
  end

  # GET /alternatives/1
  def show
    render json: @alternative
  end

  # POST /alternatives
  def create
    @alternative = Alternative.new(alternative_params)

    if @alternative.save
      render json: @alternative, status: :created, location: @alternative
    else
      render json: @alternative.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alternatives/1
  def update
    if @alternative.update(alternative_params)
      render json: @alternative
    else
      render json: @alternative.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alternatives/1
  def destroy
    @alternative.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_alternative
    @alternative = Alternative.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def alternative_params
    params.fetch(:alternative, {}).permit!
  end
end
