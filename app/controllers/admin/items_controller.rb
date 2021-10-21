class Admin::ItemsController < ApplicationController
      #before_action :authenticate_admin!
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def new
      @item = Item.new
      @genres = Genre.all
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end
  
  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_items_path
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :image_id, :introduction, :price, :is_active) #:genre_id )
  end
end
