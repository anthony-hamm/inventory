class StocksController < ApplicationController

	before_action :confirm_logged_in
	before_action :set_stock, only: [:show, :edit, :update, :destroy]

	# GET /stocks
	# GET /stocks.json
	def index
		@stocks = Stock.all
	end

	# GET /stocks/1
	# GET /stocks/1.json
	def show
	end

	# GET /stocks/new
	def new
		@stock = Stock.new
		@store = Store.all
		@item = Item.all
	end

	# GET /stocks/1/edit
	def edit
		@store = Store.all
		@item = Item.all
	end

	# POST /stocks
	# POST /stocks.json
	def create
		@stock = Stock.new(stock_params)
			if @stock.save
				redirect_to @stock, notice: 'Inventario creado de forma exitosa.'
			else
				render :new 
			end
	end

	# PATCH/PUT /stocks/1
	# PATCH/PUT /stocks/1.json
	def update
			if @stock.update(stock_params)
				redirect_to @stock, notice: 'Inventario actualizado de forma exitosa.'
			else
				render :edit 
			end
	end

	# DELETE /stocks/1
	# DELETE /stocks/1.json
	def destroy
		@stock.destroy
			redirect_to stocks_url, notice: 'Inventario elimanado de forma exitosa.'
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_stock
			@stock = Stock.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def stock_params
			params.require(:stock).permit(:store_id, :item_id, :quantity)
		end
end
