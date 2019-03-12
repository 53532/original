class User < ApplicationRecord
  

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
  
  has_many :books
  
  def borrow(book)
    book.update(user_id: self.id)
  end
  
  def back(book)
    book.update(user_id: nil)
  end
end
