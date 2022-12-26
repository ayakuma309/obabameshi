class HappiesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    current_user.happies.create!(item_id: @item.id)
    redirect_to items_path, success: '成功しました'
  end

  def destroy
    @item = Item.find(params[:item_id])
    @happy = current_user.happies.find_by!(item_id: @item.id)
    @happy.destroy!
    redirect_to items_path, success: '成功しました'
  end
end
