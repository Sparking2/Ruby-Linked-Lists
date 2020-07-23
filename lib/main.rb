class LinkedList

    attr_accessor :head

    @head = nil

    #adds new node containing value to the end of the list
    def append(value)
        if @head.nil?
            @head = Node.new()
            @head.set_value(value)
        else
            new_node = Node.new()
            new_node.set_value(value)

            start_node = @head
            
            until start_node.next_node.nil?
                start_node = start_node.next_node
            end
        
            start_node.next_node = new_node
        end
    end

    #adds new node containing value to the start of the list
    def prepend(value)
        new_node = Node.new()
        new_node.set_value(value)
        new_node.set_next_node(@head)
        @head = new_node
    end

    #returns the total number of nodes in the list
    def size
        
        if @head.nil?
            return 0
        else
            size = 0
            start_node = @head
    
            until start_node.next_node.nil?
                size = size + 1
                start_node = start_node.next_node
            end
    
            return size + 1
        end
    end

    #returns the first node in the list
    def head
        return @head.value
    end

    #returns the last node in the list
    def tail
        if @head.nil? 
            return nil
        end

        start_node = @head
        until start_node.next_node.nil?
            start_node = start_node.next_node
        end
        return start_node.value
    end

    #returns the node at the given index
    def at(index)

        current_value = 0
        start_node = @head

        until current_value == (index)
            start_node = start_node.next_node
            current_value = current_value + 1
        end

        return start_node.value
    end

    #removes the last element from the list
    def pop
        start_node = @head
        previous_node = nil
        until start_node.next_node.nil?
            previous_node = start_node
            start_node = start_node.next_node
        end
        previous_node.set_next_node(nil)
    end

    #returns true if the value is on the list otherwise returns false
    def contains?(value)
        start_node = @head
        target_locked = false
        until start_node.next_node.nil? || target_locked == true
            if(start_node.value == value)
                target_locked = true
            end
            start_node = start_node.next_node
        end

        if(start_node.value == value)
            return true
        else
            return target_locked
        end
    end

    #returns the index of the node containing valule, nil if not found
    def find(value)

        start_node = @head
        index = 0
        target_locked = false
        until start_node.next_node.nil? || target_locked == true
            if(start_node.value == value)
                target_locked = true
            end
            start_node = start_node.next_node
            index = index + 1
        end

        if start_node.value == value
            index = index + 1
            target_locked = true
        end

        if target_locked 
            index - 1
        else 
            nil
        end
    end

    #print the elements of the lists as array with format (value)->(value)->(value)->nil
    def to_s
        start_node = @head

        until start_node.next_node.nil?
            print "( #{ start_node.value } ) -> "
            start_node = start_node.next_node
        end
        print "( #{ start_node.value } ) -> nil\n"
    end

    #inserts a node with value at index
    def insert_at(value,index)
        if index > self.size
            self.append(value)
        else
            start_node = @head
            local_index = 0
            prev_node = nil
            until local_index == index
                prev_node = start_node
                start_node = start_node.next_node
                local_index = local_index + 1
            end

            new_node = Node.new()
            new_node.set_value(value)
            new_node.set_next_node(start_node)
            prev_node.set_next_node(new_node)
        end
    end

    #removes at the given index
    def remove_at(index)
        if index > self.size
            self.pop
        else
            start_node = @head
            local_index = 0
            prev_node = nil
            until local_index == index
                prev_node = start_node
                start_node = start_node.next_node
                local_index = local_index + 1
            end
            prev_node.set_next_node(start_node.next_node)
        end
    end
end

class Node

    attr_accessor :value
    attr_accessor :next_node

    def initialize
        @value = nil
        @next_node = nil
    end

    def set_value(value)
        @value = value
    end

    def set_next_node(node)
        @next_node = node
    end
end

list = LinkedList.new()

list.append('You')
list.append('Can')
list.prepend('fucking')

p "list size: #{list.size}"
p "list head: #{list.head}"
p "list tail: #{list.tail}"
p "list contains You: #{list.contains?("You")}"
p "list contains MOTHERFUCKER: #{list.contains?("MOTHERFUCKER")}"
list.to_s
p "list at: #{list.at(1)}"
list.pop
list.to_s
p "list index of You: #{list.find("You")}"
list.insert_at("Do It",1)
list.append('Can')
list.remove_at(2)
list.to_s