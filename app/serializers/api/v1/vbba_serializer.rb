class Api::V1::VbbaSerializer < ActiveModel::Serializer
  attributes :id, :post_id, :full_picture_url, :name, :fb_id, :photo,
             :likes_count, :object_id, :created_at
end
