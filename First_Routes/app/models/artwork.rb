# == Schema Information
#
# Table name: artworks
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, uniqueness: {scope: :artist_id, message: "Artwork name must be unique!"}
  validates :title, :artist_id, :image_url, presence: true
  
  belongs_to :artist, 
  class_name: :User,
  foreign_key: :artist_id
  
  has_many :artwork_shares
  
  has_many :shared_viewers,
  through: :artwork_shares,
  source: :viewer
  
end 
