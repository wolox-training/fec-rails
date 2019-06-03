# frozen_string_literal: true

module Api
  module V1
    class BookSuggestionsController < ApplicationController
      # rubocop:disable Metrics/AbcSize
      def create
        if !validated_params
          render json: { status: 'error', code: 400, message: 'Params missing.' }
        else
          booksuggestion = BookSuggestion.create(link: params[:link], author: params[:author], editorial: params[:editorial],
             year: params[:year], title: params[:title], user: current_user)
          render json: booksuggestion if booksuggestion
        end
      end

      def validated_params
        params.key?(:author) && params.key?(:title) && params.key?(:link) && params.key(:editorial) &&
          params.key?(:year)
      end
    end
  end
end
