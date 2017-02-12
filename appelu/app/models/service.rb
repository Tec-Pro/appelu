class Service < ActiveRecord::Base
  belongs_to :business
  has_many :reserves
  
  before_create :set_enable

  STATUS_ENABLE = "enabled"
  STATUS_DISABLE = "disabled"

  def set_enable
  	self.status = STATUS_ENABLE
  end

end
