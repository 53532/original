class Book < ApplicationRecord
  belongs_to :user,optional: true
  
  validates :title, presence: true, length: { maximum:255 }
  validates :author, presence: true, length: { maximum:255 }
  validates :publisher_name, length: { maximum:255 }
  validates :published_date, length: { maximum:255 }
  validates :isbn, presence: true, length: { maximum: 13 }
  validates :image_url, presence: true, length: { maximum:255 }
  
end
