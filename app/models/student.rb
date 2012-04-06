class Student < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :task

  def current_challenge
    challenge.to_param
  end

  def current_task
    task.try(:to_param)
  end

  def as_json(options = nil)
    options ||= {}
    options[:methods] = [:current_challenge, :current_task]
    super
  end
end
