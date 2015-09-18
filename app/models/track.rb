# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  track_type :string           not null
#  album_id   :integer          not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  validates(
    :name,
    :track_type,
    :album_id,
    presence: true
  )

  belongs_to(
    :album,
    class_name: "Album",
    primary_key: :id,
    foreign_key: :album_id
  )

  has_one(
    :band,
    through: :album,
    source: :band
  )
end
