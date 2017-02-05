class Reserve < ActiveRecord::Base
  belongs_to :user
  belongs_to :service

  	before_create :set_enable

	def set_enable
		self.enable = true
	end	
end
