class Appraiser < ActiveRecord::Base
  has_many :teachers
  attr_accessible :email, :first_name, :last_name
end
