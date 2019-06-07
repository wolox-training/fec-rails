# frozen_string_literal: true

module Api
  module V1
    class BooksuggestionsController < ApplicationController
      def create
        booksuggestion = BookSuggestion.new(suggestion_params)
        if booksuggestion.save
          render json: booksuggestion, status: :created
        else
          render json: { status: 'error', code: 400, message: 'Params missing.' }, status: :unprocessable_entity
        end
      end

      private

      def suggestion_params
        params.require(:book_suggestion).permit(:synopsis, :price, :author,
                                                :title, :link, :editorial, :year, :user_id)
      end
    end
  end
end
