class Sample < ActiveRecord::Base
  def self.types
    pluck(:sample_type).uniq
  end
end