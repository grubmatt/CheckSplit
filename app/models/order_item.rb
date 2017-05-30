class OrderItem < ActiveRecord::Base
	belongs_to :order
	has_many :item_splits

	accepts_nested_attributes_for :item_splits, :allow_destroy => true

	scope :for_order, -> (order) {where("order_id = ?", order)} 
	scope :for_person, -> (person) { joins(:item_splits).where(" item_splits.person_id = ? ", person)}

end
