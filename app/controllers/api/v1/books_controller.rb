# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      #before_action :authenticate_user!
      def index
        @book = Book.all
      end
      #show
    #   def show
    #     @book = Book.find[:id]
    #   end
     end
  end
end
