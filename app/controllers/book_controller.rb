# frozen_string_literal: true

class BookController < ApplicationController
  before_action :authenticate_member!
  def index
    @book = Book.all
  end
  #show
  def show
    @book = Book.find[:id]
  end
end
