class Api::V1::BagSerializer < ActiveModel::Serializer
  attributes :id, :post_id, :full_picture_url, :name, :fb_id, :photo,
             :likes_count, :object_id
end
