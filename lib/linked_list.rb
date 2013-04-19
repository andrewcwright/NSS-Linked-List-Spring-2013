require 'linked_list_item'

class LinkedList
  attr_reader :first_item

  def initialize *args
  end

  def add_item(payload)
    new_item = LinkedListItem.new(payload)
    if @first_item.nil?
      @first_item = new_item
    else
      current_item = @first_item
      while !current_item.last?
        current_item = current_item.next_list_item
      end
      current_item.next_list_item = new_item
    end
  end

  def get(n)
    if n == 0
      @first_item.payload
    else
      count = 0
      current_item = @first_item
      while count < n
        raise IndexError if current_item == nil
        current_item = current_item.next_list_item
        count+=1    
      end
      return current_item.payload
    end
  end


  def last
    if @first_item.nil?
      nil
    else
      current_item = @first_item
      while !current_item.last?
        current_item = current_item.next_list_item
      end
      return current_item.payload
    end
  end

  def size
    size = 0
    if @first_item.nil?
      size
    else
      current_item = @first_item
      while !current_item.nil?
        current_item = current_item.next_list_item
        size += 1
      end
      return size
    end
  end

  def to_s
    if @first_item.nil?
     "| |"
    elsif !@first_item.nil? && @first_item.next_list_item.nil?
      "| #{@first_item.payload} |"
    else
      current_item = @first_item
      item_string = "| "
      while !current_item.nil?
        item_string += current_item.payload
        item_string += ", " unless current_item.last?
        current_item = current_item.next_list_item
      end
    item_string += " |"
    return item_string
    end
  end

  # ========= Bonus ========== #

  def [](payload)
  end

  def []=(n, payload)
  end

  def remove(n)
  end

end
