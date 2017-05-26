class ItemSplit < ActiveRecord::Base
	belongs_to :person
	belongs_to :order_item

end
