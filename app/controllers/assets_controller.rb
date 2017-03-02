class AssetsController < ApplicationController

  def index
    @assets = Asset.all
  end

  def show
    @asset = Asset.find(params[:id])
  end

  def edit
    @asset = Asset.find(params[:id])
  end

  def new
    @asset = Asset.new
  end

  def create
    @asset = Asset.create!(asset_params.merge(user: current_user))
    if @asset.save
      redirect_to @asset
    end
  end

  def update
    @asset = Asset.find(params[:id])
    @asset.update(asset_params)

    redirect_to asset_path
  end

  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy

    redirect_to assets_path
  end

  private
  def asset_params
    params.require(:asset).permit(:id, :category, :value)
  end
end
