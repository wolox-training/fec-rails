class MailSenderWorker
  include Sidekiq::Worker

  def perform(work)
    case work
    when 'new_rent'
      RentMailer.new_rent(Rent.last).deliver_now
    end
  end
end
