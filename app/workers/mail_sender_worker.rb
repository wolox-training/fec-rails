class MailSenderWorker
  include Sidekiq::Worker

  def perform(rent)
    # Do something
  end
end
