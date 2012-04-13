class Student < ActiveRecord::Base
  has_many :exercises

  def exercise_display
    "#{exercises.count} / #{Problem.count}"
  end

  def exercise_status
    percentage = (exercises.count.to_f / Problem.count.to_f) * 100
    if percentage < 50
      'important'
    elsif percentage.between?(50, 99)
      'warning'
    else
      'success'
    end
  end

  def to_param
    account_number
  end
end
