class Business < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :user, presence: true
  has_many :customerServiceDays
  has_many :services

  before_create :set_enable


  def set_enable
  	self.enable = true
  end	
end
	