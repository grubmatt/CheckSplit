class OrderItem < ActiveRecord::Base
	belongs_to :order
	has_many :item_splits
end
