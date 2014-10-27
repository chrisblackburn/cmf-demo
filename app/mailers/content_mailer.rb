class ContentMailer < ActionMailer::Base
  def approval(approver, content)
    @approver = approver
    @content = content
    mail(to: @approver.email, subject: 'Approve this content')
  end
end
