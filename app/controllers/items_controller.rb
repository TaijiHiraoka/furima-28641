class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_buy_control, only: [:index, :show]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :new
    end
  end

  def show
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
  
  def edit
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end
  
  def destroy
    if user_signed_in? && @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to items_path
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :send_cost_id, :prefecture_id, :send_day_id, :price, :image).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def set_buy_control
    @buy_controls = BuyControl.all
  end

  def move_to_index
    unless user_signed_in? && @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

end
