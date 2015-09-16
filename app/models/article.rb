class Article < ActiveRecord::Base

  validates :title, presence: true

  belongs_to :user
  belongs_to :category
  belongs_to :gallery
  has_many   :comments

  scope :populars, ->() { order('read_count DESC').limit(5) }
  scope :search, ->(params) { params[:category_id].blank? ? where("") : where(category_id: params[:category_id]) }

end
