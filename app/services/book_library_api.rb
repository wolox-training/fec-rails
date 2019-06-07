# frozen_string_literal: true

class BookLibraryApi
  include HTTParty
  def initialize(isbn)
    url = "https://openlibrary.org/api/books?bibkeys=ISBN:#{isbn}&format=json&jscmd=data"
    response_url = HTTParty.get(url)
    @j_son = return_info_json(response_url, isbn)
  end

  def book
    @j_son
  end

  def return_info_json(response_url, isbn)
    if response_url.code == 200
      response_url_body = JSON.parse(response_url.body)["ISBN:#{isbn}"]
      format_book(response_url_body, isbn)
    else
      { message: 'Not response from server' }
    end
  end

  def format_book(response_url_body, isbn)
    {
      isbn: isbn,
      title: response_url_body['title'],
      subtitle: response_url_body['subtitle'],
      number_of_pages: response_url_body['number_of_pages'],
      author: response_url_body['authors']
    }
  end
end
