class LocationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @locations = Location.all
    respond_to do |format|
      format.html
      format.json { render :json => @locations.to_json }
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def show
    @location = Location.find(params[:id])
    @lines = Line.where(location_id: @location.id)
  end

  def create
    @location = Location.new(location_params)
    @location.save
    redirect_to locations_path
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      flash[:success] = "Successfuly saved."
    else
      flash[:error] = "Something went wrong."
    end
    redirect_to locations_path
  end

  def destroy
    @location = Location.find(params[:id])
    if !@location.lines.nil?
      flash[:error] = "Cannot delete location : exists in inventory."
    else
      if @location.destroy
        flash[:notice] = "Deleted!"
      else
        flash[:error] = "Something went wrong."
      end
    end
    redirect_to locations_path
  end

  private

  def location_params
    params.require(:location).permit(:name, :description)
  end
end
