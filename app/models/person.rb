class Person < ActiveRecord::Base
	has_secure_password

	has_many :orders
	has_many :item_splits
end
