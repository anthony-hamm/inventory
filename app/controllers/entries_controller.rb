class EntriesController < ApplicationController

  before_action :confirm_logged_in
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  def index
    @entries = Entry.all
  end

  # GET /entries/1
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new
    @store = Store.all
    @item = Item.all
  end

  # GET /entries/1/edit
  def edit
    @store = Store.all
    @item = Item.all
  end

  # POST /entries
  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to @entry, notice: 'Ingreso creado exitosamente.'
    else
      render :new 
    end
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      redirect_to @entry, notice: 'Ingreso actualizado exitosamente.'
    else
      render :edit 
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy
    redirect_to entries_url, notice: 'Ingreso eliminado exitosamente.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:store_id, :item_id, :quantity)
    end
end

