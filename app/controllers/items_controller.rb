class ItemsController < ApplicationController
  def index
    @items = RakutenWebService::Ichiba::Item.search(keyword: '介護食')
  end
end
