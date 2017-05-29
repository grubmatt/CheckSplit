class OrderItem < ActiveRecord::Base
	belongs_to :order
	has_many :item_splits

	accepts_nested_attributes_for :item_splits, :allow_destroy => true

	scope :for_order, -> (order) {where("order_id = ?", order)} 

end
