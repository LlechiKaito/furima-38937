class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @items = Item.order('created_at DESC')
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

  def edit
    @item = Item.find(params[:id])
    return unless current_user[:id] != @item.user[:id]

    @items = Item.order('created_at DESC')
    render :index
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path(item)
    else
      @item = item
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :content, :price, :condition_id, :shipping_fee_id, :shipping_area_id,
                                 :days_left_id, :category_id).merge(user_id: current_user.id)
  end
end
