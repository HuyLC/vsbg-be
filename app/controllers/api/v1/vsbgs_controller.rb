class Api::V1::VsbgsController < ApplicationController
  def data
    VsbgWorker.perform_async('')
  end
end
