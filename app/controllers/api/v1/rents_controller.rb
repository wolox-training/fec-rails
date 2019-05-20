
module Api
  module V1
    class RentsController < ApplicationController
      include Wor::Paginate
      before_action :authenticate_user!
      def create

      end

      def index
        current_user: params[:user]
        @rent = current_user.rents
        render_paginated @rent, each_serializer: RentSerializer
      end
    end
  end
end
