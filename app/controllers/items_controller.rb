class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Item.ransack(params[:q])
    @items = @q.result.order(name: :asc)
    @categories = Category.all

    respond_to do |format|
      format.html
      format.json { render :json => @items.to_json }
    end
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
    @lines = Line.where(item_id: @item.id)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "Successfuly saved."
    else
      flash[:error] = "Something went wrong : " + @item.errors.full_messages.to_sentence
    end
    redirect_to items_path
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "Successfuly saved."
    else
      flash[:error] = "Something went wrong : " + @item.errors.full_messages.to_sentence
    end
    redirect_to items_path
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.lines.count != 0
      flash[:error] = "Cannot delete item : exists in inventory."
    else
      if @item.destroy
        flash[:notice] = "Deleted!"
      else
        flash[:error] = "Something went wrong : " + @item.errors.full_messages.to_sentence
      end
    end
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :expire_on, :category_ids)
  end
end
