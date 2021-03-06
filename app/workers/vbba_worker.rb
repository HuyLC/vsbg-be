class VbbaWorker
  include Sidekiq::Worker

  def perform(url)
    # Do something
    response = if url.empty?
                 HTTParty.get("https://graph.facebook.com/v2.10/#{ENV['VBBA_ID']}/feed?
                               fields=id,full_picture,created_time,message,likes,from,place,object_id
                               &limit=100
                               &access_token=#{ENV['ACCESS_TOKEN']}")
               else
                 HTTParty.get(url)
    end
    return unless response.code == 200 || response['data'].present?
    response = response.with_indifferent_access
    response[:data].each do |e|
      vbba = Vbba.find_by(post_id: e[:id])
      if vbba.nil?
        next unless e[:full_picture].present?
        puts "#{Time.now} VBBA ********************Create #{e[:from][:name]} **********************"
        Vbba.create(post_id: e[:id], full_picture_url: e[:full_picture],
                    likes_count: e[:likes][:count],
                    name: e[:from][:name], fb_id: e[:from][:id],
                    object_id: e[:object_id], created_at: e[:created_time])
      else
        puts "#{Time.now} VBBA ********************Update #{vbba.id} ***********************"
        vbba.destroy if vbba.full_picture_url.nil? || vbba.photo.nil?
        vbba.update(likes_count: e[:likes][:count])
      end
    end
    # perform(response[:paging][:next])
  end
end
