# frozen_string_literal: true

class RentMailer < ApplicationMailer
  def new_rent(rent)
    @user = User.find(rent.user_id)
    @book = Book.find(rent.book_id)
    mail(to: @user.email, subject: 'You performed a rent')
  end
end
