class UserMailer < ApplicationMailer
	
	def welcome_send(user)
		@user = user
		mail to: user.email, subject: "Test email. Welcome.", from: 'info@mysite.com'
	end

end
