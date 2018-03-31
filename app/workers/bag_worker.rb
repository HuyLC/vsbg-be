class BagWorker
  include Sidekiq::Worker

  def perform(url)
    # Do something
    response = if url.empty?
                 HTTParty.get("https://graph.facebook.com/v2.10/#{ENV['BAG_ID']}/feed?
                               fields=id,full_picture,created_time,message,likes,from,place,object_id
                               &limit=50
                               &access_token=#{ENV['ACCESS_TOKEN']}")
               else
                 HTTParty.get(url)
 end
    return unless response.code == 200 || response['data'].present?
    response = response.with_indifferent_access
    response[:data].each do |e|
      next unless Bag.find_by(post_id: e[:id]).nil?
      puts "**********#{e[:full_picture]}****************"
      Bag.create(post_id: e[:id], full_picture_url: e[:full_picture],
                 likes_count: e[:likes][:count],
                 name: e[:from][:name], fb_id: e[:from][:id],
                 object_id: e[:object_id], created_at: e[:created_time])
    end
    perform(response[:paging][:next])
  end
end
