class Admin::ItemsController < ApplicationController
      before_action :authenticate_admin!
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item - item.find(params[:id])
  end
  
  def new
      @item = Item.new
      @genres = Genre.all
  end
  
  def create
    @itam = Item.new(item_params)
    @item.admin_id = current_admin.id
    @item.save
    redirect_to item_path
  end
  
  def update
      blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end
  
  private

  def post_image_params
    params.require(:item).permit(:name, :image_id, :introduction, :price, :is_active, :genre_id )
  end
end
