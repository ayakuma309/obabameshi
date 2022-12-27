class StaticPagesController < ApplicationController
  skip_before_action :require_login
  def top
    @item = Item.first
  end
end
