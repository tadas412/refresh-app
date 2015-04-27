class Notifications < ApplicationMailer
  default :from => 'admin@refresh-application.com',
  		  :to => Proc.new { User.pluck(:email).uniq }

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_event.subject
  #
  def new_event(event)
    @event = event
    mail( :subject => 'New event posted - Need your feedback!' )
  end
end
