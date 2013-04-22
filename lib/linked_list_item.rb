class LinkedListItem
  attr_reader :next_list_item
  attr_accessor :payload

  def initialize( payload )
  	@payload = payload
  end

  def next_list_item= (linked_list_item)
  	if linked_list_item == self
  		raise ArgumentError
	else
  		@next_list_item = linked_list_item
  	end
  end

  def last?
  	@next_list_item.nil?
  end
end
