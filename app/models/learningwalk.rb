class Learningwalk < ActiveRecord::Base
  belongs_to :teacher
  attr_accessible :growths, :highlights, :observer, :subject, :teacher_id, 
  				  :start_time, :campus

end
