class Api::V1::VsbgsController < Api::ApisController
  def index
    vsbgs = Vsbg.desc
                .page(@page_number)
                .per(@page_size)
    render json: vsbgs, meta: {
      pagination: {
        total_objects: Vsbg.count,
        per_page: @page_size,
        total_pages: vsbgs.total_pages,
        current_page: vsbgs.current_page
      }
    }
  end
end
