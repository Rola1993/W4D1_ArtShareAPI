class Artwork < ApplicationRecord
      
  validates :title, :image_url, presence: true
  validates :image_url, uniqueness: true
  validates :title, uniqueness: { scope: :artist_id }

  has_many :artwork_shares
  has_amny :shared_viewer, through: :artwork_shares, source: :viewer
  has_many :likes, as: :likeable
  has_many :comments, dependent: :destroy
  belongs_to :artist, foreign_key: :artist_id, class_name: 'User'
   
  def self.artworks_for_user_id(user_id)
    #The LEFT JOIN keyword returns all records from the left table (artworks), 
    #even if there are no matches in the right table (artwork_shares).
    Artwork
    .left_outer_joins(:artwork_shares)
    .where('(artworks.artist_id = :user_id) OR (artwork_shares.viewer_id = :user_id)', user_id: user_id)
    .distinct
  end
end
