class BookSuggestionController < ApplicationController
  def create
    if params_ok?
      book_suggestion = BookSuggestion.create(params_book_suggestion)
      render json: book_suggestion if book_suggestion
    else
      render json: { status: 'error', code: 422, message: 'Params missing.' }
    end
  end

    def params_ok?
      params.key?(:author) && params.key?(:title) && params.key?(:end_at) && params.key?(:link) &&
      params.key?(:editorial) && params.key?(:year)
    end

    def params_book_suggestion
      params.require(:book_suggestion).permit(:user_id, :title, :price, :editorial, :author, :year, :link, :synopsis)
    end
end
