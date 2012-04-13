class Student < ActiveRecord::Base
  has_many :exercises

  def exercise_display
    "#{exercises.count} / 10"
  end

  def exercise_status
    case exercises.count
      when 0..4 then 'error'
      when 5..9 then 'warning'
      else 'success'
    end
  end

  def to_param
    account_number
  end
end
