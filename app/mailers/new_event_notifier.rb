class NewEventNotifier < ApplicationMailer
  default :from => 'admin@refresh-application.com',
  		  :to => Proc.new { User.pluck(:email).uniq }

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_new_event_email(event)
    @event = event
    mail( :subject => 'New event posted - Need your feedback!' )
  end
end
