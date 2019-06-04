# frozen_string_literal: true

module Api
  module V1
    class BooksuggestionsController < ApplicationController
      # rubocop:disable Metrics/AbcSize
      def create
        if !validated_params
          render json: { status: 'error', code: 400, message: 'Params missing.' }, status: :bad_request
        else
          booksuggestion = BookSuggestion.create(link: params[:link], author: params[:author], editorial: params[:editorial],
                                                 year: params[:year], title: params[:title], user: current_user)
          render json: booksuggestion, status: :created if booksuggestion
        end
      end
      # rubocop:enable Metrics/AbcSize

      def validated_params
        params['book_suggestion'].key?(:author) && params['book_suggestion'].key?(:title) && params['book_suggestion'].key?(:link) &&
          params['book_suggestion'].key?(:editorial) && params['book_suggestion'].key?(:year)
      end
    end
  end
end
