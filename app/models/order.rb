class Order < ActiveRecord::Base
	belongs_to :person
	has_many :order_items, :dependent => :destroy
	has_many :item_splits, through: :order_items, :dependent => :destroy

	accepts_nested_attributes_for :order_items, :allow_destroy => true
	accepts_nested_attributes_for :item_splits, :allow_destroy => true

	scope :for_person, -> (person) { joins(:item_splits).where(" orders.person_id = ? OR item_splits.person_id = ? ", person, person)}

	def get_total_cost
		items = self.order_items
		sum = 0
		items.each do |item|
			sum += item.cost
		end
	end

	def get_user_cost(user)
		items = self.order_items
		sum = 0
		items.each do |item|
			if item.item_splits.person = user
				# Divide item cost by number of people splitting
				num_splits = item.item_splits.size
				sum += item.cost/num_splits
			end
		end
	end

end
	