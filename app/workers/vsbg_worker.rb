class VsbgWorker
  include Sidekiq::Worker

  def perform(url)
    # Do something
    response = if url.empty?
                 HTTParty.get("https://graph.facebook.com/v2.10/#{ENV['VSBG_ID']}/feed?
                               fields=id,full_picture,created_time,message,likes,from,place,object_id
                               &limit=100
                               &access_token=#{ENV['ACCESS_TOKEN']}")
               else
                 HTTParty.get(url)
               end
    return unless response.code == 200 || response['data'].present?
    response = response.with_indifferent_access
    response[:data].each do |e|
      vsbg = Vsbg.find_by(post_id: e[:id])
      if vsbg.nil?
        next unless e[:full_picture].present?
        puts "#{Time.now} VSBG ********************Create #{e[:from][:name]} **********************"
        Vsbg.create(post_id: e[:id], full_picture_url: e[:full_picture],
                    likes_count: e[:likes][:count],
                    name: e[:from][:name], fb_id: e[:from][:id],
                    object_id: e[:object_id], created_at: e[:created_time])
      else
        puts "#{Time.now} VSBG********************Update #{vsbg.id} ***********************"
        vsbg.destroy if vsbg.full_picture_url.nil? || vsbg.photo.nil?
        vsbg.update(likes_count: e[:likes][:count])
      end
    end
    # perform(response[:paging][:next])
  end
end
