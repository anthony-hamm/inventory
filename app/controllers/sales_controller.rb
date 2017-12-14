class SalesController < ApplicationController
	before_action :set_sale, only: [:show, :edit, :update, :destroy]

	# GET /sales
	def index
		@sales = Sale.all
	end

	# GET /sales/1
	def show
	end

	# GET /sales/new
	def new
		@sale = Sale.new
		@store = Store.all
		@item = Item.all
	end

	# GET /sales/1/edit
	def edit
		@store = Store.all
		@item = Item.all
	end

	# POST /sales
	def create
		@sale = Sale.new(sale_params)

			if @sale.save
				redirect_to @sale, notice: 'Venta creada de forma exitiosa.'
			else
				render :new 
			end
	end

	# PATCH/PUT /sales/1
	def update
			if @sale.update(sale_params)
				redirect_to @sale, notice: 'Venta actualizada de forma exitosa.'
			else
				render :edit 
			end
	end

	# DELETE /sales/1
	def destroy
		@sale.destroy
		redirect_to sales_url, notice: 'Venta eliminada de forma exitosa.'
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_sale
			@sale = Sale.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def sale_params 
			params.require(:sale).permit(:store_id, :item_id, :quantity, :sale_price)
		end
end
