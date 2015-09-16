class Gallery < ActiveRecord::Base

  mount_uploader :image, GalleryUploader

  validates :image, :title, presence: true

  belongs_to :user
  has_one :article

  scope :home_show, ->() { order('created_at DESC').limit(6) }

end
