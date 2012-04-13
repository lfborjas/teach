class Exercise < ActiveRecord::Base
  belongs_to :student

  def self.by_student
    all.group_by &:student
  end
end
