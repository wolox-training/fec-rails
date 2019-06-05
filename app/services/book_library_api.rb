# frozen_string_literal: true

class BookLibraryApi
  include HTTParty
  def initialize(isbn)
    url = "https://openlibrary.org/api/books?bibkeys=ISBN:#{isbn}&format=json&jscmd=data"
    response_url = HTTParty.get(url)
    return_info_json(response_url)
  end

  private

  def return_info_json(response_url)
    if response_url.code == 200
      response_url_body = JSON.parse(response_url.body)
      byebug
    else
      {message: 'Not response from server'}
    end
  end
end
