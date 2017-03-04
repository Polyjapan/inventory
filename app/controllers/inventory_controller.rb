class InventoryController < ApplicationController
before_action :authenticate_user!

  def index
    @q = Line.ransack(params[:q])
    @lines = @q.result.includes(:item, :location).order("items.name ASC")
    @categories = Category.all
  end

  def edit
    @line = Line.find(params[:id])
    @categories = Category.all
  end

  def create
    p = check_links(line_params)
    @line = Line.new(p)
    if @line.save
      flash[:success] = "Successfuly saved!"
    else
      flash[:error] = "Something went wrong : " + @line.errors.full_messages.to_sentence
    end
    redirect_to inventory_path
  end

  def update
    @line = Line.find(params[:id])
    p = check_links(line_params)
    if @line.update(p)
      flash[:success] = "Successfuly saved!"
    else
      flash[:error] = "Something went wrong : " + @line.errors.full_messages.to_sentence
    end

    redirect_to inventory_path
  end

  def destroy
    @line = Line.destroy params[:id]
    if @line
      flash[:notice] = "Destroyed."
    else
      flash[:error] = "Something went wrong :" + @line.errors.full_messages.to_sentence
    end
    redirect_to inventory_path
  end

  private

  def line_params
    params.require(:line).permit(:note, :item_id, :location_id, :quantity, :expire_on, :category_ids)
  end

  def check_links(p)
    if p[:item_id].to_i == 0
      @item = Item.new(:name => params["item_name"])
      @item.save
      p[:item_id] = @item.id
      p
    end
    if p[:location_id].to_i == 0
      @location = Location.new(:name => params["location_name"])
      @location.save
      p[:location_id] = @location.id
      p
    end
    p
  end
end
