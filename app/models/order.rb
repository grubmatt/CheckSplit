class Order < ActiveRecord::Base
	belongs_to :person
	has_many :order_items
end
