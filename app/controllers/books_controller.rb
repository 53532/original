class BooksController < ApplicationController
    before_action :authenticate_user!
  def index
    @books = Book.search(params[:search]).page(params[:page]).per(20)
  end

  def new
    @books = []
    
    @keyword = params[:keyword]
    if @keyword.present?
      results = RakutenWebService::Books::Total.search({
        keyword: @keyword,
        booksGenreId: "001"
        })
      
      results.each do |result|
        book = Book.new(read(result))
        @books << book
      end
    end
  end
  def create
    @book = Book.new(isbn: params[:book_isbn])
    results = RakutenWebService::Books::Total.search({isbnjan: @book.isbn})
    @book = Book.new(read(results.first))
    @book.save
    flash[:success] = '本を登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def borrow 
      @book = Book.find(params[:id])
      current_user.borrow(@book)
      flash[:success] = '本を貸し出しました。'
      redirect_back(fallback_location: root_path)
  end
  
  def back
      @book = Book.find(params[:id])
      current_user.back(@book)
      flash[:success] = '本を返却しました。'
      redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:success] = '正常に削除されました'
    redirect_to books_path
  end  
end
