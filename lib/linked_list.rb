require 'linked_list_item'

class LinkedList
  attr_accessor :first_item

  def initialize *args
    args.each {|payload| add_item(payload)}
  end

  def add_item(payload)
    new_item = LinkedListItem.new(payload)
    if @first_item.nil?
      @first_item = new_item
    else
      current_item = @first_item
      until current_item.last?
        current_item = current_item.next_list_item
      end
      current_item.next_list_item = new_item
    end
  end

  def get(n)
    current_item = @first_item
    n.times do
      raise IndexError if current_item.nil?
      current_item = current_item.next_list_item
    end
    current_item.payload
  end


  def last
    current_item = @first_item
    return nil if @first_item.nil?
    until current_item.last?
      current_item = current_item.next_list_item
    end 
    current_item.payload
  end

  def size
    current_item = @first_item
    size = 0
    until current_item.nil?
      current_item = current_item.next_list_item
      size += 1
    end
    size
  end

  def to_s
    # return "| |" if @first_item.nil?
    # current_item = @first_item
    # item_string = "| "
    # until current_item.nil?
    #   item_string += current_item.payload
    #   item_string += ", " unless current_item.last?
    #   current_item = current_item.next_list_item
    # end
    # item_string += " |"
    current_item = @first_item
    payloads = ""
    while current_item
      payloads += " "
      payloads += current_item.payload
      payloads += "," unless current_item.last?
      current_item = current_item.next_list_item
    end
    "|#{payloads} |"
  end

  # ========= Bonus ========== #

  def [](index)
    get(index)
  end

  def []=(n, payload)
    current_item = @first_item
    n.times do
      current_item = current_item.next_list_item
    end
    current_item.payload = payload
  end

  def remove(n)
    if n == 0
      raise IndexError if @first_item.nil?
      @first_item = @first_item.next_list_item
    else
      count = 0
      left_item = @first_item
      while count < (n-1)
        raise IndexError if left_item.nil?
        left_item = left_item.next_list_item
        count += 1
      end
      raise IndexError if left_item.nil? or left_item.next_list_item.nil?
      right_item = left_item.next_list_item.next_list_item
      left_item.next_list_item = right_item
    end
  end

  # ========= Index exercise ========== #

  def indexOf payload
    current_item = @first_item
    index = 0
    while current_item
      if current_item.payload == payload
        return index
      end
      current_item = current_item.next_list_item
      index += 1
    end
  end

end
