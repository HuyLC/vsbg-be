class Admin::DatasController < ApplicationController
  def new;end

  def vsbgs
    VsbgWorker.perform_async('')
    @message = 'Get data vsbg success!'
    render :new
  end

  def bags
    BagWorker.perform_async('')
    @message = 'Get data bag success!'
    render :new
  end

  def vbbas
    VbbaWorker.perform_async('')
    @message = 'Get data vbba success!'
    render :new
  end
end
