# frozen_string_literal: true

class BookController < ApplicationController
  #index
  def index
    if current_user.user_signed_in?:
      @book = Book.all
    end
  end
  #show
  def show
    @book = Book.find[:id]
  end
end
