class Cohort < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :date_records, through: :students

end