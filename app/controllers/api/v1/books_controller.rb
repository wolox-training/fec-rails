# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate
      before_action :authenticate_user!
      def index
        render_paginated Book.all
      end

      def show
        render_paginated json: Book.find(params[:id])
      end
     end
  end
end
