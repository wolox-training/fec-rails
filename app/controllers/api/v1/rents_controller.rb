# frozen_string_literal: true

module Api
  module V1
    class RentsController < ApplicationController
      include Wor::Paginate
      include DeviseTokenAuth::Concerns::SetUserByToken
      include Pundit
      before_action :authenticate_user!
      before_action :set_locale
      # rubocop:disable Metrics/AbcSize
      def create
        if params.key?(:book_id) && params.key?(:start_at) && params.key?(:end_at)
          rent = Rent.create(user: current_user, book: find_book(params[:book_id]), start_at: params[:start_at], end_at: params[:end_at])
          RentMailer.new_rent(rent).deliver_later
          render json: rent if rent
        else
          render json: { status: 'error', code: 422, message: 'Params missing.' }
        end
      end
      # rubocop:enable Metrics/AbcSize

      def index
        #redefine endpoint from previus commit (replace current_user with pundit scope)
        render_paginated policy_scope(Rent)
      end

      def find_book(book_id)
        Book.find_by(id: book_id)
      end

      def set_locale
        I18n.locale = current_user['locale']
      end
    end
  end
end
