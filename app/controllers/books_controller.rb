class BooksController < ApplicationController
  def index
    @books = Book.all
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

  def show
    @book = Book.find(params[:id])
    if current_user.borrow?(@book)
      current_user.back(@book)
      flash[:success] = '本を返却しました。'
    else
      current_user.borrow(@book)
      flash[:success] = '本を貸出ました。'
    end
  end
  
  def create
    @book = book.new(isbn: params[:book_isbn])
    results = RakutenWebService::Books::Total.search({isbn: @book.isbn})
    @book = Book.new(read(results.first))
    @book.save
  end
  
  def destroy
  end
  
end

