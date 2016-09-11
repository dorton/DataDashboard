class TeacherMailer < ActionMailer::Base



  def learning_walk(teacher, learningwalk, current_teacher)
  	@teacher = teacher
  	@learningwalk = learningwalk
  	@current_teacher = current_teacher
    mail( to: teacher.email, from: "'#{current_teacher.full_name}' <learningwalk@hattech.net>", bcc: "#{teacher.apprai_email}" , reply_to: current_teacher.email, subject: "Learning Walk - #{teacher.full_name}")
  end

  def monthly_mailer(teacher, learningwalk)
  	@teacher = teacher
  	@learningwalk = learningwalk
  	today = Date.today
  	beg = today.beginning_of_month
  	last = beg - 1
  	lastmonth = last.strftime("%B")
    
    recipients = [ "ccarnes@houstonisd.org, mgutie16@houstonisd.org, mvizi@houstonisd.org" ]

    mail( to: recipients, from: "DataTracker <learningwalk@hattech.net>", reply_to: "ccarnes@houstonisd.org", subject: "Learning Walks for #{lastmonth}")
  end
end

