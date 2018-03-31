class Api::V1::BagsController < ApplicationController
  def data
    BagWorker.perform_async('')
  end
end
