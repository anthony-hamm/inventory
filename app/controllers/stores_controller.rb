class StoresController < ApplicationController

	before_action :confirm_logged_in
	before_action :set_store, only: [:show, :edit, :update, :destroy]

	# GET /stores
	# GET /stores.json
	def index
		@stores = Store.all
	end

	# GET /stores/1
	# GET /stores/1.json
	def show
	end

	# GET /stores/new
	def new
		@store = Store.new
	end

	# GET /stores/1/edit
	def edit
		@store = Store.find(params[:id])
	end

	# POST /stores
	# POST /stores.json
	def create
		@store = Store.new(store_params)
			if @store.save
				redirect_to @store, notice: 'La Tienda fue creada de forma exitosa.'
			else
				render :new
			end
	end

	# PATCH/PUT /stores/1
	# PATCH/PUT /stores/1.json
	def update
		if @store.update(store_params)
			redirect_to @store, notice: 'La Tienda fue actualizada de forma exitosa.'
		else
			render :edit
		end
	end

	# DELETE /stores/1
	# DELETE /stores/1.json
	def destroy
		@store.destroy
		redirect_to stores_url, notice: 'La Tienda fue borrada de forma exitosa.'
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_store
			@store = Store.includes(stocks: :item).find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def store_params
			params.require(:store).permit(:name, :description, :administrator_id, :clerk_id)
		end
end
