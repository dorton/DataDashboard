class MonthlyMailer
	  
	  def self.send
        TeacherMailer.monthly_mailer(@teacher, @learningwalk).deliver
      end
end