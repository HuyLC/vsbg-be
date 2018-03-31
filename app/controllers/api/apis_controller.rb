class Api::ApisController < ActionController::API
  before_action :pagination

  def pagination
    @page_number = params[:page].to_i.zero? ? 1 : params[:page]
    @page_size = params[:size].to_i.zero? ? 12 : params[:size]
  end
end
