class User < ActiveRecord::Base
  # because subclass have and belong to many, do we need to describe any relationships?
  # don't need the inherritance column?
  def self.types
    %w(Producer Instructor Student)
  end
end

