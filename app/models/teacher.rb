class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  ROLES = %w[admin teacher]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :appraiser_id, :apprai, :apprai_email
  attr_accessible :first_name, :grade, :last_name, :id, :email, :appraiser, :appraiser_email, 
                  :role, :departmental, :depart_class, :superuser, :campus, :campus_id, :lesson_plan

  belongs_to :appraiser # foreign key in join table
  # belongs_to :campus
  has_many :students, :order => 'last_name ASC'
  has_many :observations, through: :students
  has_many :learningwalks

  

  def full_name
      "#{first_name} #{last_name}"
  end

  def email_name
    "#{last_name}, #{first_name}"
  end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      teacher = find_by_id(row["id"]) || new
      teacher.attributes = row.to_hash.slice(*accessible_attributes)
      teacher.save!
    end

  end

  def self.to_csv
    FasterCSV.generate do |csv|
      csv << column_names
      all.each do |teacher|
        csv << teacher.attributes.values_at(*column_names)
      end
    end
  end

  def admin?
    role == "admin"
  end

  def teacher?
    role == "teacher"
  end


  
end
