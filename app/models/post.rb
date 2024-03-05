class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  has_many :sources
  has_many :videos
  has_many_attached :images

end
