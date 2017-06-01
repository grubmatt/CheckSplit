class ItemSplit < ActiveRecord::Base
	belongs_to :person
	belongs_to :order_item
	belongs_to :order

	validates_presence_of :person_id
end
