# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_type :string           not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  validates(
    :name,
    :album_type,
    :band_id,
    presence: true
  )

  belongs_to(
    :band,
    class_name: "Band",
    primary_key: :id,
    foreign_key: :band_id
  )

  has_many(
    :tracks,
    class_name: "Track",
    primary_key: :id,
    foreign_key: :album_id,
    dependent: :destroy
  )
end
