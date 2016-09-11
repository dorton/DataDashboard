class Lessonplan < ActiveRecord::Base
  attr_accessible :campus, :lesson_plan, :name

  

  mount_uploader :lesson_plan, DocumentUploader
  
end
