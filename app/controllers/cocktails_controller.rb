class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show]

  # GET /cocktails
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = @cocktail.doses
  end

  # GET /cocktails/new
  def new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cocktail_params
      params.require(:cocktail).permit(:name)
    end
end
