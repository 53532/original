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
  end

  def destroy
  end
  
  private
  
  def read(result)
    title = result['title']
    author = result['author']
    publisher_name = result['publisherName']
    published_date = result['salesDate']
    isbn = result['isbn']
    image_url = result['mediumImageUrl'].gsub('?_ex=120x120','')
    
    {
      title: title,
      author: author,
      publisher_name: publisher_name,
      published_date: published_date,
      isbn: isbn,
      image_url: image_url
   }
  end
end

