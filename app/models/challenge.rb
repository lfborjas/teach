class Challenge < ActiveRecord::Base
  has_many :tasks

  before_validation do |c|
    c.slug = c.title.parameterize
  end

  validates_uniqueness_of :slug

  def to_param
    slug
  end
end
