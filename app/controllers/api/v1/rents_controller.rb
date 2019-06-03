# frozen_string_literal: true

module Api
  module V1
    class RentsController < ApplicationController
      include Wor::Paginate
      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :authenticate_user!
      # rubocop:disable Metrics/AbcSize
      def create
        if !validated_params
          render json: { status: 'error', code: 400, message: 'Params missing.' }
        else
          user = User.find_by email: request.headers[:uid]
          book = Book.find_by id: params[:book_id]
          @rent = Rent.create(user: user, book: book, start_at: params[:start_at], end_at: params[:end_at])
          render json: @rent
        end
      end
      # rubocop:enable Metrics/AbcSize

      def validated_params
        params.key?(:book_id) && params.key?(:start_at) && params.key?(:end_at)
      end

      def index
        current_user = User.find_by email: request.headers[:uid]
        @rent = current_user.rents
        render_paginated @rent, each_serializer: RentSerializer
      end
    end
  end
end
