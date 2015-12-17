class Cohort < ActiveRecord::Base
  belongs_to :producer

  has_and_belongs_to_many :instructors
  has_and_belongs_to_many :students
end