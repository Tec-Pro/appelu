class Service < ActiveRecord::Base
  belongs_to :business
  has_many :reserves
  
 	before_create :set_enable

	def set_enable
		self.enable = true
	end	
end
