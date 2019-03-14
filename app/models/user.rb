class User < ApplicationRecord
  

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
  
  has_many :books, dependent: :destroy
  
  def borrow(book)
    book.update(user_id: self.id)
  end
  
  def back(book)
    book.update(user_id: nil)
  end
  
  def borrow?(book)
    if
      book.user_id == self.id
      return true
    else
      return false
    end
  end

end
