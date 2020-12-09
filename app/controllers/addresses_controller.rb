class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @address_buy = AddressBuy.new
  end
  
  def create
    @address_buy = AddressBuy.new(address_params)
    if @address_buy.valid?
      pay_item
      @address_buy.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  def address_params
    params.require(:address_buy).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    unless user_signed_in? && @item.user_id != current_user.id
      redirect_to root_path and return
    end

    if @item.buy_control != nil
      redirect_to root_path and return
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end
end
