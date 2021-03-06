class Book < ApplicationRecord
  acts_as_paranoid
  belongs_to :user,optional: true
  validates :title, presence: true, length: { maximum:255 }
  validates :author, presence: true, length: { maximum:255 }
  validates :publisher_name, presence: true, length: { maximum:255 }
  validates :published_date, presence: true, length: { maximum:255 }
  validates :isbn, presence: true, length: { maximum: 13 }
  validates :image_url, presence: true, length: { maximum:255 }

  def self.search(search)
    if search
       Book.where(['title LIKE ? or isbn LIKE ?', "%#{search}%","%#{search}%"])
    else
      Book.all
    end
  end
end