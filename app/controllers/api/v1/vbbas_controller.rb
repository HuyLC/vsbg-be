class Api::V1::VbbasController < Api::ApisController
  def data
    VbbaWorker.perform_async('')
  end

  def index
    vbbas = Vabba.desc
                 .page(@page_number)
                 .per(@page_size)
    render json: vbbas, meta: {
      pagination: {
        total_objects: Vbba.count,
        per_page: @page_size,
        total_pages: vbbas.total_pages,
        current_page: vbbas.current_page
      }
    }
  end
end
