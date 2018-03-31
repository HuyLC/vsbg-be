class Admin::DatasController < ApplicationController
  def new; end

  def vsbgs
    VsbgWorker.perform_async('')
  end

  def bags
    BagWorker.perform_async('')
  end

  def vbbas
    VbbaWorker.perform_async('')
  end
end
