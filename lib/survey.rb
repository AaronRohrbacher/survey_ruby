class Survey < ActiveRecord::Base
  has_many(:questions)
  before_save(:upcase_name)
private

  def upcase_name
    self.name=(name().split.map(&:capitalize).join(' '))
  end
end
