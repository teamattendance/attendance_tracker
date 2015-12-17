class DateRecord < ActiveRecord::Base
  belongs_to :student
  belongs_to :cohort, through: :student
end
