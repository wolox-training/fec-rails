# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate
      before_action :authenticate_user!
      def index
        byebug
        @book = Book.all
        render_paginated @book, each_serializer: BookSerializer
      end

      def show
        @book = Book.find(params[:id])
        render json: @book
      end
    end
  end
end
