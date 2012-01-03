class UserMailer < ActionMailer::Base
  default :from => "artfikan@gmail.com"
  
  def invite(sender_id,receiver_email, project_id)
    @sender = User.find(sender_id)
    @project = Project.find(project_id)
    mail(:to => receiver_email, :subject => 'kanbanBoard Invite')
  end
end
