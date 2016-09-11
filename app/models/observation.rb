class Observation < ActiveRecord::Base
  belongs_to :student
  attr_accessible :observer, :on_task, :off_task, :notes, :campus

  def avatar_url
  file_name = "#{student.stu_id}.jpg"
  if Rails.application.assets.find_asset file_name
    file_name
  else
    "blank.jpeg"
  end
end
end
