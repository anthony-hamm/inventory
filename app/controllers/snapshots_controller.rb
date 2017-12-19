class SnapshotsController < ApplicationController
  before_action :confirm_logged_in

  def index
    @snapshots = Snapshot.includes(:store).all
  end

  def new
    @store = Store.includes(:stocks, :items).find(params[:store_id])
    @form = SnapshotForm.new(store: @store)
  end

  def create
    @store = Store.includes(:stocks, :items).find(params[:store_id])
    @form = SnapshotForm.new(store: @store).submit(items_params)
    redirect_to store_path(@store)
  end

  def items_params
    params[:store].permit(items: [:id, :quantity])[:items]
  end
end
