class Person < ActiveRecord::Base
	has_secure_password

	has_many :orders
	has_many :item_splits

	def self.authenticate(email, password)
    	find_by_email(email).try(:authenticate, password)
  	end

  	def proper_name
 		"#{self.first_name} #{self.last_name}"
  	end

  	def outstanding
  		
  	end
end
