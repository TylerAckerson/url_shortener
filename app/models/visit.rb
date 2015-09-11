# == Schema Information
#
# Table name: visits
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#  shortened_url_id :integer
#

class Visit < ActiveRecord::Base
  belongs_to :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id

  belongs_to :shortened_url,
     class_name: "ShortenedUrl",
     foreign_key: :shortened_url_id,
     primary_key: :id

  def self.record_visit(user, short_url)
    create!(user_id: user.id, shortened_url_id: short_url.id)
  end

end
