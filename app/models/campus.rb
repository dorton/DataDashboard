class Campus < ActiveRecord::Base
  attr_accessible :name

  # has_many :teachers
  # has_many :students, through: :teachers
end
