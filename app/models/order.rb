class Order < ActiveRecord::Base
	belongs_to :person
	has_many :order_items, :dependent => :destroy
	has_many :item_splits, through: :order_items, :dependent => :destroy

	validates_presence_of :description

	scope :created_by, -> (person) { where(" person_id = ? ", person)}

	def get_total_cost
		items = self.order_items
		sum = 0
		items.each do |item|
			sum += item.cost
		end
		return sum
	end

	def get_total_items
		self.order_items.size
	end

	def get_user_cost(user)
		items = self.order_items
		sum = 0
		items.each do |item|
			item.item_splits.each do |split|
				if split.person == user
					# Divide item cost by number of people splitting
					num_splits = item.item_splits.size
					sum += item.cost/num_splits
				end
			end
		end
		return sum
	end

end
	