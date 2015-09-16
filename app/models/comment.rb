class Comment < ActiveRecord::Base
  
  validates :email, :subject, :message, presence: true

  belongs_to :article

end
