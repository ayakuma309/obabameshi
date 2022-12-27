class AngriesController < ApplicationController
  def index
    @items = current_user.angry_items
  end

  def create
    @item = Item.find(params[:item_id])
    current_user.angries.create!(item_id: @item.id)
		redirect_to items_path, success: '成功しました'
  end

  def destroy
    @item = Item.find(params[:item_id])
    angry = current_user.angries.find_by!(item_id: @item.id)
    angry.destroy!
		redirect_to items_path, success: '成功しました'
  end
end
