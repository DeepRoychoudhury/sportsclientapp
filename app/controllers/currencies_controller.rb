class CurrenciesController < ApplicationController
	before_action :set_currency, only: [:show, :edit, :update, :destroy]

  # GET /currencies/new
  def new
  	@currency = Currency.new
  end

	def show
	end

  def create
  	@currency = Currency.new(currency_params)

    respond_to do |format|
      if @currency.save
        format.html { redirect_to @currency, notice: 'Sport was successfully created.' }
        format.json { render :show, status: :created, location: @currency }
      else
        format.html { render :new }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
    def set_currency
      @currency = Currency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def currency_params
      params.require(:currency).permit(:currencytype, :currency)
    end
end
