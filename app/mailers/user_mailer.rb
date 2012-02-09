class UserMailer < ActionMailer::Base
  default :from => "artfikan@gmail.com"

  def invite(sender_id,receiver_email, project_id)
    @sender = User.find(sender_id)
    @project = Project.find(project_id)
    mail(:to => receiver_email, :subject => 'kanbanBoard Invite')
  end

  def reset_password_email(user)
    @user = user
    @url  = "#{ActionMailer::Base.default_url_options[:host]}/reset_passwords/#{user.reset_password_token}/edit"
    mail(:to => @user.email, :subject => 'Reset Password - kanbanBoard')
  end

end
