class OrderItem < ActiveRecord::Base
	belongs_to :order
	has_many :item_splits

	attr_accessor :people

	validates_presence_of :description, :cost
	validates_numericality_of :cost

	scope :for_person, -> (person) { joins(:item_splits).where(" item_splits.person_id = ? ", person)}

	def num_splitters
		return self.item_splits.size
	end

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
