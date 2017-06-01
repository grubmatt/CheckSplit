class Person < ActiveRecord::Base
	has_secure_password

	has_many :orders
	has_many :item_splits

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, :with => /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :message => "is not a valid format"
  

	def self.authenticate(email, password)
    	find_by_email(email).try(:authenticate, password)
  	end

  	def proper_name
 		"#{self.first_name} #{self.last_name}"
  	end

  	def outstanding
  		
  	end
end
