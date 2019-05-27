# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate
      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :authenticate_user!
      def index
        book = Book.all
        render_paginated book, each_serializer: BookSerializer
      end

      def show
        book = Book.find(params[:id])
        render json: book
      end
    end
  end
end
