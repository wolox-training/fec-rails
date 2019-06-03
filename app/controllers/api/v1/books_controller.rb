# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate
      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :authenticate_user!
      def index
        render_paginated Book
      end

      def show
        render json: Book.find(params[:id])
      end
    end
  end
end
