class RentMailer < ApplicationMailer
  def new_rent(rent)
    @user = rent.user
    mail(to: @user.email, subject: 'You performed a rent')
  end
end
