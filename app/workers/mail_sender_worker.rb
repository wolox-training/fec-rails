class MailSenderWorker
  include Sidekiq::Worker

  def perform(work)
    case work
    when 'new_rent'
      puts Rent.last #send email here (implemet in next commit i assume)
    end
  end
end
