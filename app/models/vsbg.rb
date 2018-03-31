class Vsbg < ApplicationRecord
  before_save :set_image_by_params_image
  mount_uploader :photo, VsbgUploader

  private

  def set_image_by_params_image
    return if full_picture_url.nil?
    self.photo = VsbgUploader.new
    photo.download! full_picture_url
    photo.store!
  end
end
