class Api::V1::VbbasController < ApplicationController
  def data
    VbbaWorker.perform_async('')
  end
end
