class ItemsController < ApplicationController
  def index
    create_rakuten_data(params)
    @q = Item.ransack(params[:q])
    @items = @q.result.page(params[:page])
  end


  private
    def create_rakuten_data(params)
      @results = RakutenWebService::Ichiba::Item.search(
        keyword: '介護食',
        page: params[:page],
        hits: 10)

      @results.each do |result|
        item = Item.new(read(result))
        unless Item.all.exists?(name: item.name)
          item.save
        end
      end
    end

    def read(result)
      image= result['mediumImageUrls'][0]
      name = result['itemName']
      url = result['itemUrl']
      {
        image: image,
        name: name,
        url: url
      }
    end
end
