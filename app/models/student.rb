class Student < User
  has_and_belongs_to_many :cohorts
  has_many :date_records
end