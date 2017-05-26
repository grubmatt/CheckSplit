class OrderItem < ActiveRecord::Base
	belongs_to :order
	has_many :item_splits

	scope :for_order, -> (order) {where("order_id = ?", order)} 

end
