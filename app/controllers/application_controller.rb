class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    books_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
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