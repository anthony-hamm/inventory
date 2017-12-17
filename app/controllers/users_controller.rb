class UsersController < ApplicationController

	before_action :confirm_logged_in, :set_stores
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	# GET /users
	def index
		@users = User.all
		@stores = Store.all
	end

	# GET /users/1
	def show

	end

	# GET /users/new
	def new
		@user = User.new
	end

	# GET /users/1/edit
	def edit
		@stores = Store.all
		@item = Item.all
	end

	# POST /users
	def create
		@user = User.new(user_params)

			if @user.save
				redirect_to @user, notice: 'El Usuario fue creado de forma exitosa.'
			else
				@stores = Store.all
				render :new 
			end
	end

	# PATCH/PUT /users/1
	def update
			if @user.update(user_params)
				redirect_to @user, notice: 'El Usuario fue actualizado de forma exitosa.'
			else
				@stores = Store.all
				render :edit 
			end
	end

	# DELETE /users/1
	def destroy
		@user.destroy
		redirect_to users_url, notice: 'El Usuario fue eliminado de forma exitosa.'
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_user
			@user = User.includes(:stores).find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def user_params
			params.require(:user).permit(:name, :phone, :email, :comments, :password, :rol_id, :username, store_ids: [])
		end

  	def set_stores
			@stores = Store.all
		end
end