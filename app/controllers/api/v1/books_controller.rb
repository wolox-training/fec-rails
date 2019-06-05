# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate
      include BookLibraryApi
      before_action :authenticate_user!, only: %i[index show]
      def index
        render_paginated Book
      end

      def show
        render Book.find(params[:id])
      end

      def find_book
        if params[:isbn]
          book_request = BookLibraryApi.find_book(params[:isbn])
          render json: book_request
        else
          render json: { status: 'error', code: 400, message: 'Params missing.' }, status: :bad_request
        end
      end
    end
  end
end
