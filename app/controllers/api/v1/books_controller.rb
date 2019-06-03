# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate
      before_action :authenticate_user!
      def index
        render_paginated Book
      end

      def show
<<<<<<< HEAD
        render json: Book.find(params[:id])
=======
        render Book.find(params[:id])
>>>>>>> Rent-endpoints
      end
    end
  end
end
