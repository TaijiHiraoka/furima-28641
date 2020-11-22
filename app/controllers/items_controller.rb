class ItemsController < ApplicationController

  def index
    @items = Item.all
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :send_cost_id, :prefecture_id, :send_day_id, :price, :image).merge(user_id: current_user.id)
  end

end
