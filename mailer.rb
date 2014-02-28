require "action_mailer"
require 'erb'

ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   :address        => "smtp.gmail.com",
   :port           => 587,
   :domain         => "xxx",
   :authentication => :plain,
   :user_name      => "email",
   :password       => "password",
   :enable_starttls_auto => true
  }


class Mailer < ActionMailer::Base
  def notification(to_email, code)
    @code = code
    @to_email = to_email
    mail(to: to_email, subject: "Your vote for xxx") do |format|
      format.html { 
        render 'mailer/notification.html.erb'
      }
    end
  end
end
