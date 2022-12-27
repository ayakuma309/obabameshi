class NormalsController < ApplicationController
  def index
    @items = current_user.normal_items
  end

  def create
    @item = Item.find(params[:item_id])
    current_user.normals.create!(item_id: @item.id)
    redirect_to items_path, success: '成功しました'
  end

  def destroy
    @item = Item.find(params[:item_id])
    normal = current_user.normals.find_by!(item_id: @item.id)
    normal.destroy!
    redirect_to items_path, success: '成功しました'
  end
end
