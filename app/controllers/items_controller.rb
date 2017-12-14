class ItemsController < ApplicationController

	before_action :confirm_logged_in
	before_action :set_item, only: [:show, :edit, :update, :destroy]

	# GET /items
	# GET /items.json
	def index
		@items = Item.all
	end

	# GET /items/1
	def show
	end

	# GET /items/new
	def new
		@item = Item.new
	end

	# GET /items/1/edit
	def edit
		@item = Item.find(params[:id])
	end

	# POST /items
	def create
		@item = Item.new(item_params)
			if @item.save
				redirect_to @item, notice: 'Artículo creado de forma exitosa.'
			else
				render :new
			end
	end

	# PATCH/PUT /items/1
	def update
			if @item.update(item_params)
				redirect_to @item, notice: 'Artículo actualizado de forma exitosa'
			else
				render :edit
			end
	end

	# DELETE /items/1
	def destroy
		@item.destroy
			redirect_to items_url, notice: 'Artículo elimanado de forma exitosa.'
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_item
			@item = Item.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def item_params
			params.require(:item).permit(:name, :description, :price)
		end
end
