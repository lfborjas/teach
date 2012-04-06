class Task < ActiveRecord::Base
  belongs_to :challenge

  before_create do |t|
    t.token
  end
end
