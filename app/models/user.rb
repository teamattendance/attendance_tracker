class User < ActiveRecord::Base
  has_secure_password
  # because subclass have and belong to many, do we need to describe any relationships?
  # don't need the inherritance column?
  has_and_belongs_to_many :cohorts

  def self.types
    %w(Producer Instructor Student)
  end
end

