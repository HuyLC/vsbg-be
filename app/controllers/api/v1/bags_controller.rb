class Api::V1::BagsController < Api::ApisController
  def index
    bags = Bag.desc
              .page(@page_number)
              .per(@page_size)
    render json: bags, meta: {
      pagination: {
        total_objects: Bags.count,
        per_page: @page_size,
        total_pages: bags.total_pages,
        current_page: bags.current_page
      }
    }
  end
end
