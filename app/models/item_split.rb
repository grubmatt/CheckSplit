class ItemSplit < ActiveRecord::Base
	belongs_to :person
	belongs_to :order_item
	
	scope :for_person, -> (person) { where("person_id = ?", person)}
end
