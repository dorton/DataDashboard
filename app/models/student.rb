class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :observations
  attr_accessible :first_name, :last_name, :stu_id, :teacher_id, :met_math_ayp, 
                  :met_reading_ayp, :bubble_math, :bubble_reading, :avatar, :reading_nce, 
                  :math_nce, :reading_staar_scale, :math_staar_scale, :sped, 
                  :elar_cat_1, :elar_cat_2, :elar_cat_3, 
                  :math_cat_1, :math_cat_2, :math_cat_3, :math_cat_4, :math_cat_5, 
                  :writing_cat_1, :writing_cat_2, :writing_cat_3, 
                  :writing_staar_scale, :met_reading_standard, :reading_test_version, 
                  :met_math_standard, :math_test_version, :depart_class, :campus
  # mount_uploader :avatar, ImageUploader

  validates_presence_of :teacher_id
  
  def self.import(file)
  	CSV.foreach(file.path, headers: true) do |row|
  		student = find_by_stu_id(row["stu_id"]) || new
  		student.attributes = row.to_hash.slice(*accessible_attributes)
  		student.save!
  	end

  end

  def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |student|
      csv << student.attributes.values_at(*column_names)
    end
  end
end

def full_name
      "#{first_name} #{last_name}"
end

def self.search(search)
  if search
    # this may not work with the #or until Rails 4.0
    where("first_name LIKE ?", "%#{search}%").or.("last_name LIKE ?", "%#{search}%")
    #find(:all, :conditions => ['first_name LIKE ? OR last_name LIKE ?', "%#{search}%","%#{search}%"])
  else
    scoped
  end
end

def avatar_url
  file_name = "#{stu_id}.jpg"
  file_name_name = "#{last_name}_#{first_name}.JPG"
  file_name_campus = "#{last_name}_#{first_name}_#{campus}.JPG"
  if Rails.application.assets.find_asset file_name_name
    file_name_name
  elsif Rails.application.assets.find_asset file_name
    file_name
  elsif Rails.application.assets.find_asset file_name_campus
    file_name_campus
  else
    "blank.jpeg"
  end
end

end
