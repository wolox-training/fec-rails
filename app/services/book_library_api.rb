# frozen_string_literal: true

module BookLibraryApi
  include HTTPParty

  def get_book(isbn)
    url = "https://openlibrary.org/api/books?bibkeys=ISBN:#{isbn}&format=json&jscmd=data"
    response = HTTPParty.get(url)
    return_info_json(response)
  end

  private

  def return_info_json(response)
    if response.body.status == 200
      response_body = JSON.parse(response.body)
      byebug
    else
      {message: 'Not response from server'}
    end
  end
end
