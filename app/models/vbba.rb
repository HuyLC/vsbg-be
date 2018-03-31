class Vbba < ApplicationRecord
  before_save :set_image_by_params_image
  mount_uploader :photo, VbbaUploader

  private

  def set_image_by_params_image
    return if full_picture_url.nil?
    self.photo = VbbaUploader.new
    photo.download! full_picture_url
    photo.store!
  end
end
