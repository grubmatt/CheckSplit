class OrderItem < ActiveRecord::Base
	belongs_to :order
	has_many :item_splits

	accepts_nested_attributes_for :item_splits, :allow_destroy => true

	scope :for_order, -> (order) {where("order_id = ?", order)} 
	scope :for_person, -> (person) { joins(:item_splits).where(" item_splits.person_id = ? ", person)}

	def splitters
		item_splits = self.item_splits
		splitters = ""
		item_splits.each do |split|
			splitters += split.person.proper_name + ", "
		end

		# [0...-2] removes the extra ", "
		return splitters[0...-2]
	end
end	
