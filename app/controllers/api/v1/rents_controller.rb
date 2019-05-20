# frozen_string_literal: true

module Api
  module V1
    class RentsController < ApplicationController
      include Wor::Paginate
      before_action :authenticate_user!
      def create
        unless params[:book_id].presence? && params[:start_at].presence? && params[:end_at].presence?
          @rent = Rent.create(user: User.where(uid: headers[:uid]), book: params[:book_id], start_at: params[:start_at], end_at: params[:end_at])
          render json: @rent
        else
          render json: {status: "error", code: 3000, message: "Params missing."}
        end
      end

      def index
        current_user = User.where(uid: headers[:uid])
        @rent = current_user.rents
        render_paginated @rent, each_serializer: RentSerializer
      end
    end
  end
end
